variable "vm_size" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_D1_v2" # 3.5 GB, 1 CPU 
}
 variable "envs" {
	type = list(string)
	description = "Entornos"
	default = ["dev", "pre", "pro"]
}


 variable "vms" {
        type = list(string)
        description = "Maquinas"
        default = ["master", "worker1", "nfs"]
}
