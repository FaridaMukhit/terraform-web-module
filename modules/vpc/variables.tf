variable "env" {
  type        = string
  description = "this is a variable for Environment"
  default     = "dev"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  type        = string
  description = "the tenancy of existing VPCs from dedicated to default instantly"
  default     = "default"
}

variable "pub_subnet_cidrA" {
  type        = string
  description = "cidr block of public subnet"
  default     = "10.0.1.0/24"
}

variable "pub_subnet_cidrB" {
  type        = string
  description = "cidr block of public subnet"
  default     = "10.0.2.0/24"
}

variable "pub_subnet_cidrC" {
  type        = string
  description = "cidr block of public subnet"
  default     = "10.0.3.0/24"
}

variable "private_subnet_cidrA" {
  type        = string
  description = "cidr block of private subnet"
  default     = "10.0.11.0/24"
}

variable "private_subnet_cidrB" {
  type        = string
  description = "cidr block of private subnet"
  default     = "10.0.12.0/24"
}

variable "private_subnet_cidrC" {
  type        = string
  description = "cidr block of private subnet"
  default     = "10.0.13.0/24"
}

variable "az_1a" {
  type        = string
  description = "availability zone"
  default     = "us-east-1a"
}

variable "az_1b" {
  type        = string
  description = "availability zone"
  default     = "us-east-1b"
}

variable "az_1c" {
  type        = string
  description = "availability zone"
  default     = "us-east-1c"
}

variable "cidr_block" {
  description = "ingress/egress cidr block"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ingress_ports" {
  type        = list(string)
  description = "Variable for ingress ports"
  default     = ["22", "80"]
}