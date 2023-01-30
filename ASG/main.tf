provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA33UW7BTR5GET5DWL"
  secret_key = "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"
}

resource "aws_autoscaling_group" "myasg" {
  name                      = "myasg"
  max_size                  = 2
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.mylc.name
  target_group_arns         = [var.target_group_arn]
  vpc_zone_identifier       = [var.pub_sub1, var.pub_sub2]
  tag {
    key                 = "Name"
    value               = "my-test-asg"
    propagate_at_launch = true
  }


}

resource "aws_launch_configuration" "mylc" {
  name            = "mylc"
  image_id        = var.imageid
  instance_type   = "t2.micro"
  security_groups = [var.sgid]
  user_data       = <<-EOF
              #!/bin/bash
              yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from $(hostname -f)" > /var/www/html/index.html
              EOF

  lifecycle {
    create_before_destroy = true
  }
}