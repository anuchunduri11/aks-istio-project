data "azurerm_resource_group" "resource_group" {
  name = "${var.name}-rg"
}

data "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.name}aks"
  resource_group_name = data.azurerm_resource_group.resource_group.name
}
