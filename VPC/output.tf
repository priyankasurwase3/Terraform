output "secgrpid" {
    value = aws_security_group.mysgrp.id
}
output "pri_sub_id1" {
  value = element(aws_subnet.pri_sub.*.id, 1 )
}
output "pub_sub_id1" {
  value = element(aws_subnet.pub_sub.*.id, 1 )
}
output "pri_sub_id2" {
  value = element(aws_subnet.pri_sub.*.id, 2 )
}
output "pub_sub_id2" {
  value = element(aws_subnet.pub_sub.*.id, 2 )
}
output "sg_id" {
 value = aws_security_group.mysgrp.id
}

output "vpc_id" {
  value = aws_vpc.myvpc.id
}