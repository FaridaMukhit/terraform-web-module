data "template_file" "user_data" {
  template = file("/home/ec2-user/terraform-web-module/modules/vpc/user_data.sh")
  vars = {
    Environment = var.env
  }
}