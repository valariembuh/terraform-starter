resource "aws_lb" "this" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"

  subnets         = var.subnets
  security_groups = var.security_groups

  tags = {
    Name = var.name
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }

  depends_on = [aws_lb.this]
}
