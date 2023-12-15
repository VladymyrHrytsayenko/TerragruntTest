variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}


variable "public_cidr" {
  type = list(any)
  default = [
    "10.0.10.0/24",
    "10.0.16.0/24"
  ]

}

variable "privat_cidr" {
  type = list(any)
  default = [
    "10.0.11.0/24",
    "10.0.17.0/24"
  ]
}
