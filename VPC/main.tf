provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA33UW7BTR5GET5DWL"
  secret_key = "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"
}
# Query all avilable Availibility Zone
data "aws_availability_zones" "available" {}

resource "aws_vpc" "myvpc" {
  cidr_block       =  var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
}