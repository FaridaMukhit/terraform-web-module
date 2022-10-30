variable "env" {
  type        = string
  description = "this is a variable for Environment"
  default     = "dev"
}

variable "app_port" {
  type        = number
  description = "this is a variable for port"
  default     = 80
}

variable "vpc_id" {
  type        = string
  description = "this is a variable for vpc"
  default     = "vpc-0e176f3417bb9549e"
}

variable "subnets" {
  type        = list(string)
  description = "this is a variable for subnets"
  default     = ["subnet-01e52e38768cfb1b2", "subnet-02b080608993328fb"]
}

variable "ingress_ports" {
  type        = list(string)
  description = "Variable for ingress ports"
  default     = ["443", "80"]
}


