#Variable donde esta definida la localización.
variable "location" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "West Europe"
}
#variable del storage account
variable "storage_account" {
  type = string
  description = "Nombre para la storage account"
  default = "storaccangelunircp2"
}
#variable del public key
variable "public_key_path" {
  type = string
  description = "Ruta para la clave pública de acceso a las instancias"
  default = "~/.ssh/id_rsa.pub" # o la ruta correspondiente
}
#variable del ssh user
variable "ssh_user" {
  type = string
  description = "Usuario para hacer ssh"
  default = "adminUser"
}