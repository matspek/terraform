

resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.location
}
resource "azurerm_service_plan" "serviceplan" {
  name                = "service-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
  depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_linux_web_app" "web_app" {
  name                = "matspekkwebapi"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.serviceplan.id

  site_config {}
  depends_on = [ azurerm_service_plan.serviceplan ]
}

