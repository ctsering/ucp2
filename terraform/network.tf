# Creación de red
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

#resource "azurerm_virtual_network" "myNet" {
#    name                = "kubernetesnet"
#    address_space       = ["10.0.0.0/16"]
#    location            = azurerm_resource_group.rg.location
#    resource_group_name = azurerm_resource_group.rg.name

#   tags = {
#        environment = "ucp2"
#    }
#}

# Creación de subnet
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet

resource "azurerm_subnet" "mySubnet" {
    name                   = "terraformsubnet"
    resource_group_name    = azurerm_resource_group.rg.name
    virtual_network_name   = azurerm_virtual_network.myNet.name
    address_prefixes       = ["10.0.1.0/24"]

}

# Create NIC
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface
# Tarjeta de red para la VM1
resource "azurerm_network_interface" name {
  count		      = length(var.vms) 
  name                = "vmnic${count.index}"  
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "myipconfiguration${count.index}"
    subnet_id                      = azurerm_subnet.mySubnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.10"
    public_ip_address_id           = azurerm_public_ip.name.id
  }

    tags = {
        environment = "ucp2"
    }

}

# IP pública
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip

resource "azurerm_public_ip" name {
  acount	      = length(var.vms)
  name                = "vmip${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "ucp2"
    }

}
