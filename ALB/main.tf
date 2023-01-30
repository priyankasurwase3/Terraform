provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA33UW7BTR5GET5DWL"
  secret_key = "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"
}

resource "aws_lb" "myalb" {
  name               = "myalb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.mysgrp]
  subnets            = [var.pub_sub1,var.pub_sub2]

  #enable_deletion_protection = true


  tags = {
    Environment = "myalb"
  }
}

resource "aws_lb_listener" "mylistener" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mytg.arn
  }
}
resource "aws_lb_target_group" "mytg" {
  name     = "mytg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

