resource "aws_instance" "arc-ec2" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "${var.namespace}-${var.organisation}-${var.environment}-server"
  }

  key_name                    = aws_key_pair.generated_key.key_name
  subnet_id                   = data.aws_subnet.public.id
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [aws_security_group.ec2-sg.id]

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    iops                  = var.root_volume_iops
    throughput            = var.root_volume_throughput
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = var.ebs_device_name
    volume_type           = var.ebs_volume_type
    volume_size           = var.ebs_volume_size
    iops                  = var.ebs_volume_iops
    throughput            = var.ebs_volume_throughput
    encrypted             = var.ebs_encrypted
    delete_on_termination = true
  }

  iam_instance_profile = var.iam_instance_profile

  disable_api_termination = var.disable_api_termination

  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior

  monitoring = var.monitoring

  credit_specification {
    cpu_credits = var.cpu_credits
  }

  ebs_optimized = var.ebs_optimized

  tenancy = var.tenancy

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_tokens                 = var.metadata_http_tokens
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
  }

  user_data = var.user_data
}

resource "tls_private_key" "httpdkey" {
  algorithm = var.tls_algorithm
  rsa_bits  = var.tls_rsa_bits
}


resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.httpdkey.public_key_openssh
}

resource "aws_security_group" "ec2-sg" {
  name        = "${var.namespace}-${var.organisation}-${var.environment}-ec2-sg"
  description = var.security_groups["ec2-sg"].description
  vpc_id      = data.aws_vpc.vpc.id

  tags = {
    name = "${var.namespace}-${var.organisation}-${var.environment}-ec2-sg"
  }
}

resource "aws_security_group_rule" "ec2-sg-rules" {
  count = length(var.security_groups["ec2-sg"].rules)

  security_group_id = aws_security_group.ec2-sg.id
  type              = var.security_groups["ec2-sg"].rules[count.index].type
  from_port         = var.security_groups["ec2-sg"].rules[count.index].from_port
  to_port           = var.security_groups["ec2-sg"].rules[count.index].to_port
  protocol          = var.security_groups["ec2-sg"].rules[count.index].protocol
  cidr_blocks       = [var.security_groups["ec2-sg"].rules[count.index].cidr_ipv4]
  description       = var.security_groups["ec2-sg"].rules[count.index].key
}
