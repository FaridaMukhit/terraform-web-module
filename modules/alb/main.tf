####### target group #########
resource "aws_lb_target_group" "main" {
  name     = replace(local.name, "rtype", "tg")
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path = "/"
    port = var.app_port
  }
  tags = {
    Name = replace(local.name, "rtype", "tg")
  }
}

########### load balancer ########
resource "aws_lb" "main" {
  name               = replace(local.name, "rtype", "alb")
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main.id]
  subnets            = var.subnets
  tags = {
    Name = replace(local.name, "rtype", "alb")
  }
}

########### listner rule ########
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.app_port
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}