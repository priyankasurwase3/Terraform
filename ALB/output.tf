output "dns_name" {
    value = aws_lb.myalb.dns_name
}

output "tgarn" {
value = aws_lb_target_group.mytg.arn
}