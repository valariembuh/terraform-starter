provider "aws" {
  region = "us-east-1"
}

# =========================
# VPC
# =========================
module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  name     = "dev-vpc"
}

# =========================
# SECURITY GROUP
# =========================
module "sg" {
  source = "../../modules/security-group"

  name   = "dev-sg"
  vpc_id = module.vpc.vpc_id

  ssh_cidr  = ["0.0.0.0/0"]
  http_cidr = ["0.0.0.0/0"]
}

# =========================
# TARGET GROUP
# =========================
module "tg" {
  source = "../../modules/target-group"

  name   = "dev-tg"
  vpc_id = module.vpc.vpc_id
}

# =========================
# ALB
# =========================
module "alb" {
  source = "../../modules/alb"

  name            = "dev-alb"
  subnets         = module.vpc.public_subnet_ids
  security_groups = [module.sg.security_group_id]

  # IMPORTANT: ALB must know where to send traffic
  target_group_arn = module.tg.target_group_arn
}

# =========================
# AUTOSCALING GROUP
# =========================
module "asg" {
  source = "../../modules/autoscaling"

  name          = "dev-asg"
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  subnets         = module.vpc.public_subnet_ids
  security_groups = [module.sg.security_group_id]

  target_group_arn = module.tg.target_group_arn
}
