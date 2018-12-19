# Configure Microsoft Azure Provider
provider "azurerm" {
	subscription_id = "${var.subscription_id}"
	client_id       = "${var.client_id}"
    client_secret   = "${var.client_secret}"
    tenant_id       = "${var.tenant_id}"
}

# Create Storage Account
resource "azurerm_storage_account" "testsa" {
	name 				= "${var.sa_name}"
	location			= "${var.location}"
	resource_group_name		= "${var.resource_group}"
	account_tier			= "Standard"
	account_replication_type 	= "LRS"
}

# Create a storage container
resource "azurerm_storage_container" "container" {
	name				= "${var.sa_name}-container"
	resource_group_name		= "${var.resource_group}"
	storage_account_name		= "${azurerm_storage_account.testsa.name}"
	container_access_type		= "private"
}
