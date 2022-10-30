module "vpc" {
  source               = "/home/ec2-user/terraform-web-module/modules/vpc"
  env                  = "dev"
  vpc_cidr_block       = "10.0.0.0/16"
  instance_tenancy     = "default"
  pub_subnet_cidrA     = "10.0.1.0/24"
  pub_subnet_cidrB     = "10.0.2.0/24"
  pub_subnet_cidrC     = "10.0.3.0/24"
  private_subnet_cidrA = "10.0.11.0/24"
  private_subnet_cidrB = "10.0.12.0/24"
  private_subnet_cidrC = "10.0.13.0/24"
  az_1a                = "us-east-1a"
  az_1b                = "us-east-1b"
  az_1c                = "us-east-1c"
  cidr_block           = "0.0.0.0/0"
  ingress_ports        = ["22", "80"]

}

module "alb" {
  source        = "/home/ec2-user/terraform-web-module/modules/alb"
  env           = "dev"
  app_port      = 80
  vpc_id        = module.vpc.vpc_id
  subnets       = [module.vpc.public_subnet1_id, module.vpc.public_subnet2_id, module.vpc.public_subnet3_id]
  ingress_ports = ["443", "80"]
}

module "asg" {
  source              = "/home/ec2-user/terraform-web-module/modules/asg"
  env                 = "dev"
  instance_type       = "t2.micro"
  max_size            = "5"
  min_size            = "2"
  desired_size        = "2"
  vpc_zone_identifier = [module.vpc.public_subnet1_id, module.vpc.public_subnet1_id, module.vpc.public_subnet1_id]
  ingress_ports       = ["22", "80"]
  vpc_id              = module.vpc.vpc_id
  lb_target_group_arn = module.alb.lb_target_group_arn
}
