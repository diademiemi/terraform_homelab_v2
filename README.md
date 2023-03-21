# Terraform files to deploy necessary resources for my homelab

This repository is part of my homelab_v2 setup, please check the following repository for more information: https://github.com/diademiemi/homelab_v2  

This is pretty basic Terraform and doesn't really warrant any further documentation. I'm using Terraform to deploy the virtual machines on my local NAS and on my Hetzner dedicated server. Both are running Libvirt which is deployed through the [Ansible project](https://github.com/diademiemi/ansible_project_homelab_v2).  

The local machine has four disks forwarded to it which are used for ZFS volumes. The Hetzner dedicated server just uses a disk image.  

## [Project Structure](#project-structure)
File/Directory | Purpose
--- | ---
`projects/` | Terraform projects
`projects/dns/` | Project to set necessary DNS records for my homelab
`projects/dns/env/prod.tfvars` | Terraform variables for the homelab
`projects/vm/` | Project to deploy virtual machines for my homelab
`projects/vm/env/hetzner.tfvars` | Variables to deploy the VM on the Hetzner dedicated server
`projects/vm/env/local.tfvars` | Variables to deploy the VM on my local NAS
