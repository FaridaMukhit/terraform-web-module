locals {
  name = "aws-${var.env}-rtype"
  common_tags = {
    Team        = "DevOps"
    Owner       = "Farida"
    Environment = var.env
    Managed_by  = "AWS"
    Name        = "${var.env}-alb"
  }
}
