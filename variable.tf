variable "instancetype" {
  default = "t2.micro"
}
variable "keypair" {
  default = "project-key"
}
variable "vpc-cidr" {
  default = "10.0.0.0/16"
}

variable "instance-ami" {
  default = "ami-018ba43095ff50d08"
}

variable "subnet-cidr" {
  default = "10.0.1.0/24"
}
variable "avzone" {
  default = "us-east-1a"
}
variable "region" {
  default = "us-east-1"

}