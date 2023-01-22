# ssh -nNT -L localhost:6000:/run/libvirt/libvirt-sock localserver
libvirt_uri = "qemu+tcp://localhost:6000/system"

vm_memory = "61440"
vm_vcpu  = "12"

libvirt_external_interface = "enp7s0"

vm_hostname   = "omori" # My network hostnames are named after indie games or content from them
vm_domain     = "blahaj.sh"
vm_nameserver = "9.9.9.9"
vm_mac        = "5E:0D:5E:6F:13:45" # Random, but consistent for static leases

vm_ssh_pub_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGSj6rJkx/d2w1c4qagmh7s/TJQHGOAanWprgiHzUKIW" # Public Key
