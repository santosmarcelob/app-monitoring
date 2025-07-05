data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "application_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = var.public_subnet1
  vpc_security_group_ids = [var.vpc_security_group_ids[0]]
  associate_public_ip_address = true
  key_name =  aws_key_pair.public.key_name
  
  
  tags = {
    Name = "Instance_application_server${var.tags}"
  }
}

resource "aws_instance" "db_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = var.private_subnet2
  vpc_security_group_ids = [var.vpc_security_group_ids[1]]
  associate_public_ip_address = false
  key_name = aws_key_pair.public.key_name
  availability_zone = "us-east-1b"

  tags = {
    Name = "Instance_db_server${var.tags}"
  }
}

resource "aws_instance" "monitoring_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = var.private_subnet1
  vpc_security_group_ids = [var.vpc_security_group_ids[1]]
  associate_public_ip_address = false
  key_name =aws_key_pair.public.key_name
  availability_zone = "us-east-1b"

  tags = {
    Name = "Instance_monitoring_server${var.tags}"
  }
}

resource "null_resource" "ansible_playbook" {
  provisioner "file" {
   
    source      = "playbook.yml"
    destination = "/home/ubuntu/playbook.yml"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install python3 python3-pip -y",
      "sudo pip3 install ansible", 
      "ansible-playbook -i '${aws_instance.application_server.public_ip},' -e host=${aws_instance.application_server.public_ip
} --ssh-common-args='-o StrictHostKeyChecking=no' /home/ubuntu/playbook.yml"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = local_sensitive_file.pem_file.content
    host        = aws_instance.application_server.public_ip

  }

  depends_on = [aws_instance.application_server,local_sensitive_file.pem_file ]
}


resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "public" {
  key_name   = "myKey"
  public_key = tls_private_key.key.public_key_openssh
}

resource "local_sensitive_file" "pem_file" {
  filename             = "./key/myKey.pem"
  file_permission      = "600"
  directory_permission = "700"
  content              = tls_private_key.key.private_key_pem
}

resource "null_resource" "set_permissions" {
  provisioner "local-exec" {
    #command = "cmd.exe /C icacls ./key/myKey.pem /grant %USERNAME%:(R,W) /inheritance:r"
    command = "chmod 600 ./key/myKey.pem"
  }
  depends_on = [local_sensitive_file.pem_file]
}