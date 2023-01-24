resource "libvirt_volume" "opensuse_microos" {
  name   = "opensuse_microos"
  pool   = "default"
  source = "https://download.opensuse.org/tumbleweed/appliances/openSUSE-MicroOS.x86_64-OpenStack-Cloud.qcow2" # MicroOS cloud-init image
  format = "qcow2"
}

resource "libvirt_volume" "vm_disk" {
  name           = "vm_disk"
  pool           = "default"
  base_volume_id = libvirt_volume.opensuse_microos.id
  size           = var.vm_disk_size
}

data "template_file" "vm_cloudinit" {
  template = file("${path.module}/cloudinit.tpl")
  vars = {
    hostname       = var.vm_hostname
    domain         = var.vm_domain
    ssh_public_key = var.vm_ssh_pub_key
    nameserver     = var.vm_nameserver
  }
}

resource "libvirt_cloudinit_disk" "init" {
  name = "init"
  pool = "default"

  user_data = data.template_file.vm_cloudinit.rendered

}


resource "libvirt_domain" "vm" {
  name   = "vm"
  memory = var.vm_memory
  vcpu   = var.vm_vcpu

  cloudinit = libvirt_cloudinit_disk.init.id // Attach cloud-init disk

  disk {
    volume_id = libvirt_volume.vm_disk.id
  }

  dynamic "disk" {
    for_each = var.vm_disk_passthroughs
    content {
      block_device = disk.value
    }
  }

  network_interface {
    macvtap        = var.libvirt_external_interface
    hostname       = var.vm_hostname
    wait_for_lease = false
    mac            = var.vm_mac // Hetzner wants us to use a provided MAC address
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
  }

}
