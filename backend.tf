variable "token" {
 type = string
}

variable "cloud-id" {
 type = string
}

variable "folder-id" {
 type = string
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud-id
  folder_id = var.folder-id
}

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "forterraform"                     #bucket name
    region     = "ru-central1"
    key        = "forterraform/terraform.tfstate"   #bucket name/state filename
    access_key = "#########################"        #service accaunt key id. Can't be variable
    secret_key = "################################" #shown only when key just created. Can't be variable

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
