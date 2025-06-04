# Terraform - Proxmox VM Clone Deployment

This project uses [Terraform](https://www.terraform.io/) to provision and manage a virtual machine via virtual machine
template on a [Proxmox](https://www.proxmox.com/) server using the [Telmate Proxmox provider](https://github.com/Telmate/terraform-provider-proxmox).

## Features

- Clones a VM from a Proxmox template
  - `ubuntu-server-24.04`
- Configures hardware (CPU, memory, disk, network, etc)
- Sets up Cloud-Init
- Uses variables for sensitive credentials
- **All VM configuration items are explicitly defined in Terraform to match the template, ensuring that the full VM state is tracked and managed by Terraform.**

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.12.1
- Proxmox API
- Proxmox VM Template

## Usage

1. **Clone Repository**

2. **Configure Credentials**

   ```shell
   cp terraform-proxmox-vm-deployment/credentials.auto.tfvars.example terraform-proxmox-vm-deployment/credentials.auto.tfvars
   ```

   Edit `proxmox/credentials.auto.tfvars`:
   - `pm_api_url`: Proxmox API Endpoint
   - `pm_api_token_id`: API Token ID
   - `pm_api_token_secret`: API Token Secret
   - `ciuser`: Cloud-Init Username
   - `cipassword`: Cloud-Init Password
   - `sshkey`: SSH Public Key

3. **Initialize Terraform**

   ```shell
   terraform init
   ```

4. **Plan & Apply**

   ```shell
   terraform plan
   terraform apply
   ```

5. **Destroy**

    ```shell
    terraform destroy
    ```

## References

- [Telmate Proxmox Provider GitHub](https://github.com/Telmate/terraform-provider-proxmox)
- [Telmate Proxmox Provider Registry](https://registry.terraform.io/providers/Telmate/proxmox/latest)
- [Terraform Input Variables](https://www.terraform.io/language/values/variables)
