# terraform {
#   backend "azurerm"{
#     resource_group_name  = "rg-terraform"
#     storage_account_name = "stterraform"
#     container_name       = "tfstate"
#     key                  = "terraform.tfstate"
#   }

# }

terraform {
    backend "local" {
        path = "terraform.tfstate"
    }
}