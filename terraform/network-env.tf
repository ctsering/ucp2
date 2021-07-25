# Creación de red
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

resource "azurerm_virtual_network" "myNet" {
    name                = "kubernetesnet"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    tags = {
        environment = "ucp2"
    }
}

# Creación de subnet
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet

resource "azurerm_subnet" "mySubnetEnv" {
    	count		       = length(var.envs)
	name                   = "terraformsubnet-${var.envs[count.index]}"
	resource_group_name    = azurerm_resource_group.rg.name
    	virtual_network_name   = azurerm_virtual_network.myNet.name
    	address_prefixes       = ["10.0.${100 + count.index}.0/24"]

}
