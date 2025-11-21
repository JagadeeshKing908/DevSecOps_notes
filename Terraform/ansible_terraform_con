provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "my_instance" {
  tags = {
    Name = var.iname
    Env  = "Dev"
  }
  ami           = "ami-0d176f79571d18a8f"
  instance_type = "t2.micro"
  key_name      = "New_key"
  root_block_device {
    volume_size = 8
  }
  user_data_base64 = base64encode(<<-EOF
#!/bin/bash
useradd jagadeesh
echo "jagadeesh:123" |  chpasswd
touch /etc/sudoers.d/10_Temp_root_access
echo "%jagadeesh ALL=(ALL) NOPASSWD:ALL" |  tee -a /etc/sudoers.d/10_Temp_root_access
visudo -c
mkdir /home/jagadeesh/.ssh
chown jagadeesh:jagadeesh /home/jagadeesh/.ssh
chmod 700 /home/jagadeesh/.ssh
touch /home/jagadeesh/.ssh/authorized_keys
chown jagadeesh:jagadeesh /home/jagadeesh/.ssh/authorized_keys
chmod 600 /home/jagadeesh/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCghrX2xMrGkS+VTIvVmIbfuyAVeeVPXqRTVaY1+ApLJQOKGaokXMoBfe5Vl2nnzaF0mnPOV5igFit1WMANKsmDCBjz0tmSDpQDTBP4uaeJX5d2Q6ZGLJaNLW4tU89lZvfQ03qCE+OqctI8pDY7vFYWQbsoEpB5LL+PYtCQSfYkgYreVdymw8JI//caJ46gKC/oZputR0DJMsK9W2pITniokDt2Wj7ZLBp1GYX/rCBXzZnRl+kUXoF1Dg8m6VwyuRa8gpFml8TbEOVt2+wzc6T9UqmrC0Nyw3kEQw8/MFNtYcq2ACB8OF2clV0Sq+8Q+/dxc4fER3t+8fUa5oji5ZlE6rfOKv5YT8cFYzpmynubPIvgbKLZylo4eTN0xl/5FS9R7wZOTOEKTYufqiDwVnbao/voWIuNg1gZAU4RDRlBbjNNv1Gzm/Zk+ZtHubnQ3jw8n3L2g07mRBZP1wHU250zFNE84XjIofMmC0aVxk9NTprffBtbZHVAXYqhwP5+N6c= jagadeesh@ip-172-31-14-222.ap-south-1.compute.internal"  |  tee /home/jagadeesh/.ssh/authorized_keys
systemctl restart sshd
hostnamectl set-hostname ${var.iname}
echo "${var.iname}" | tee -a /etc/hosts
EOF
  )

}
output "my_instance" {
  value = "hostname : ${var.iname} , Private_IP : ${aws_instance.my_instance.private_ip}"
}
variable "iname" {
type = string
}

Add private ip of your host along with hostname in your master you will get direct connection with ssh to the server
