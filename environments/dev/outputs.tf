output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "autoscaling_group_name" {
  value = module.asg.autoscaling_group_name
}

output "target_group_arn" {
  value = module.tg.target_group_arn
}
