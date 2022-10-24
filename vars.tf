variable "resourcegroup_details" {
  type = object({
    name     = string
    location = string
  })

}

variable "vnet_details" {

  type = object({
    address_space = list(string)
    name          = string
  })


}

variable "subnet_details" {

  type = object({
    names = list(string)
  })


}




