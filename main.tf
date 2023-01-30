terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA33UW7BTR5GET5DWL"
  secret_key = "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"
}

module "vpc" {
    source = "./VPC"
    pub_cidr_block = ["10.0.1.0/24","10.0.2.0/24"]
    pri_cidr_block = ["10.0.3.0/24","10.0.4.0/24"]
    vpc_cidr = "10.0.0.0/16"
}



module "alb" {
   source = "./ALB"
   mysgrp = module.vpc.sg_id
   pub_sub1 = module.vpc.pub_sub_id1
   pub_sub2 = module.vpc.pub_sub_id2
   vpc_id = module.vpc.vpc_id
}
module "asg" {
    source = "./ASG"
    sgid = module.vpc.sg_id
    imageid = var.imageid
    target_group_arn = module.alb.tgarn
    pub_sub1 = module.vpc.pub_sub_id1
    pub_sub2 = module.vpc.pub_sub_id2
}