variable "amis" {
  type = map
  default =  {

      "sa-east-1" = "ami-0b9517e2052e8be7a"
      "us-east-2" = "ami-089c6f2e3866f0f14"

  }
}

variable "cdirs_remote_acess"  {

    type = "list"
    default = ["138.122.83.3/32","139.122.83.3/32"]
  
}