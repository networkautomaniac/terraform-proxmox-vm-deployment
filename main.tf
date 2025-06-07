resource "proxmox_vm_qemu" "ubuntu-noble-terraform-example" {
  target_node = "proxmox"
  name        = "ubuntu-noble-terraform-example"
  clone       = "ubuntu-server-24.04"
  full_clone  = true
  os_type     = "cloud-init"

  # Hardware Configuration
  memory  = 8192
  balloon = 8192
  cpu {
    cores   = 4
    sockets = 1
    type    = "host"
  }

  machine = "q35"
  scsihw  = "virtio-scsi-single"

  disks {
    ide {
      ide2 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size       = 64
          cache      = "none"
          storage    = "local-lvm"
          discard    = true
          emulatessd = true
          iothread   = true
          replicate  = false
        }
      }
    }
  }

  network {
    id       = 0
    model    = "virtio"
    bridge   = "vmbr0"
    tag      = var.vlan
    firewall = true
  }

  serial {
    id   = 0
    type = "socket"
  }

  # Cloud-Init Configuration
  ciuser = var.ciuser
  # searchdomain = var.searchdomain
  # nameserver   = var.nameserver
  cipassword = var.cipassword
  sshkeys    = var.sshkey
  ciupgrade  = false
  ipconfig0  = "ip=${lookup(local.vlan_data, var.vlan).ip},gw=${lookup(local.vlan_data, var.vlan).gw}"




  # Options Configuration
  boot  = "order=scsi0;net0"
  agent = 1

}
