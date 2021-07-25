# Creamos una máquina virtual
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

resource "azurerm_linux_virtual_machine" "myVM2" {
    name                = "my-second-azure-vm"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.vm_size
    admin_username      = var.ssh_user
    network_interface_ids = [ azurerm_network_interface.myNic2.id ]
    disable_password_authentication = true
# conexion admin user
    admin_ssh_key {
        username   = var.ssh_user
        public_key = file(var.public_key_path)
    }
#Disco estandar lectura/escritura
    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
#maquina virtual
    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }
#referencia de la imagen de la VM
    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }
#diagnostico del boot
    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }

    tags = {
        environment = "ucp2"
    }

}
