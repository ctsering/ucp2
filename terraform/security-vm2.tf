# Security group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group
# Grupo de seguridad que funciona como un firewall, abrimos el puerto 22 para poder acceder vía ssh desde el exterior.
resource "azurerm_network_security_group" "mySecGroup2" {
    name                = "sshtraffic2"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "unircp2"
    }
}

# Vinculamos el security group al interface de red
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association

resource "azurerm_network_interface_security_group_association" "mySecGroupAssociation2" {
    network_interface_id      = azurerm_network_interface.myNic2.id
    network_security_group_id = azurerm_network_security_group.mySecGroup2.id

}