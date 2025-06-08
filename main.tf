resource "proxmox_vm_qemu" "ubuntu-noble-terraform-example" {
  target_node = var.target_node
  name        = var.name
  clone       = var.clone
  full_clone  = var.full_clone
  os_type     = var.os_type

  # Hardware Configuration
  memory  = var.memory
  balloon = var.balloon

  cpu {
    cores   = var.cpu_cores
    sockets = var.cpu_sockets
    type    = var.cpu_type
  }

  machine = var.machine
  scsihw  = var.scsihw

  disks {
    ide {
      ide0 {
        cloudinit {
          storage = var.cloudinit_storage
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size       = var.disk_size
          cache      = var.disk_cache
          storage    = var.disk_storage
          discard    = var.disk_discard
          emulatessd = var.disk_emulatessd
          iothread   = var.disk_iothread
          replicate  = var.disk_replicate
        }
      }
    }
  }

  network {
    id       = var.network_id
    model    = var.network_model
    bridge   = var.network_bridge
    tag      = var.network_tag
    firewall = var.network_firewall
  }

  serial {
    id   = var.serial_id
    type = var.serial_type
  }

  # Cloud-Init Configuration
  ciuser     = var.ciuser
  cipassword = var.cipassword
  sshkeys    = var.sshkey
  ciupgrade  = var.ciupgrade
  ipconfig0  = "ip=${lookup(local.vlan_data, var.network_tag).ip},gw=${lookup(local.vlan_data, var.network_tag).gw}"

  # Options Configuration
  boot  = var.boot
  agent = var.agent

}
