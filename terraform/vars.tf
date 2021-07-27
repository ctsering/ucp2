variable "vm_size" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_D1_v2" # 3.5 GB, 1 CPU
}

variable "envs" {
	type = list(string)
	description = "Entornos"
	default = ["pro", "pre", "dev"]
}


variable "vms" {
        type = list(string)
        description = "Maquinas"
        default = ["master-nfs", "worker1", "worker2"]
}
