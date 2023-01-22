# ssh -nNT -L localhost:5000:/run/libvirt/libvirt-sock hetznerserver
libvirt_uri = "qemu+tcp://localhost:5000/system"

vm_memory = "32768"
vm_vcpu  = "6"

libvirt_external_interface = "enp34s0"

vm_hostname   = "sunny" # My network hostnames are named after indie games or content from them
vm_domain     = "blahaj.sh"
vm_nameserver = "9.9.9.9"
vm_mac        = "00:50:56:01:00:78"

vm_ssh_pub_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSj6rJkx/d2w1c4qagmh7s/TJQHGOAanWprgiHzUKIW" # Public Key
