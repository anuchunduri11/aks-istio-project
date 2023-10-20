resource "azurerm_resource_group" "resource_group" {
  name     = "${var.name}-rg"
  location = var.location
}

resource "azurerm_virtual_network" "vir_network" {
  name                = "${var.name}vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks_subnet"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.vir_network.name
  address_prefixes     = [var.aks_subnet_address_prefix]
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.name}aks"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  dns_prefix          = "${var.name}dns"
  kubernetes_version  = "1.27"

  identity {
    type = "SystemAssigned"
  }
  default_node_pool {
    name           = "devopspool"
    vm_size        = var.vm_size
    node_count     = var.devopspool_count
    type           = "VirtualMachineScaleSets"
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  network_profile {
    network_plugin = "azure"
  }

  # service_mesh_profile {
  #   mode = "Istio"
  # }
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.name}acr"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_resource_group.resource_group.id
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  depends_on           = [azurerm_kubernetes_cluster.aks]
}
