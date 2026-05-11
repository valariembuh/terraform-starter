resource "aws_launch_template" "this" {
  name_prefix   = var.name
  image_id      = var.ami
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_groups
  }

  user_data = base64encode(<<EOF
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "Hello from Terraform ASG instance" > /var/www/html/index.html
EOF
  )
}

resource "aws_autoscaling_group" "this" {
  desired_capacity    = 2
  max_size           = 3
  min_size           = 1

  vpc_zone_identifier = var.subnets

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]

  health_check_type         = "ELB"
  health_check_grace_period = 60
}
