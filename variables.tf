variable "ami_id" {
  type        = string
  description = "AMI Id for the EC2 Instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

variable "availability_zone" {
  type        = string
  description = "value"
}

variable "key_name" {
  type        = string
  description = "AWS Key Pair to be used for SSH"
}

variable "name" {
  type        = string
  default     = ""
  description = "Name tag value of EC2"
}

variable "ec2_tags" {
  type        = map(string)
  description = "Tags to be attached for the ec2"
}

variable "subnet_id" {
  type    = string
  default = null
}

variable "sg_name" {
  type    = string
  default = "aws_sg"
}

variable "sg_description" {
  type    = string
  default = ""
}

variable "sg_vpc_id" {
  type    = string
  default = null
}

variable "sg_tags" {
  type = map(string)
}

variable "sg_inbound_ports" {
  type = list(object({
    from_port   = number
    to_port     = number
    description = string
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "SG Group Inbound Rules"
  default = [{
    from_port   = 22
    to_port     = 22
    description = "Allow SSH"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}