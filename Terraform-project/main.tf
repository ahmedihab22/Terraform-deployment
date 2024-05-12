module "ALB" {
  source = "../modules/ALB"
  // CALL YOUR VARIABLES HERE....
}

module "security-group" {
  source = "../modules/security-group"
  // CALL YOUR VARIABLES HERE....
}

module "RDS" {
  source = "../modules/RDS"
  // CALL YOUR VARIABLES HERE....
}

module "53-DNS" {
  source = "../modules/53-DNS"
  // CALL YOUR VARIABLES HERE....
}
module "ec2" {
  source = "../modules/ec2"
  // CALL YOUR VARIABLES HERE....
}

module "nat-gateway" {
  source = "../modules/nat-gateway"
  // CALL YOUR VARIABLES HERE....
}

module "private-subnet" {
  source = "../modules/private-subnet"
  // CALL YOUR VARIABLES HERE....
}

module "public-subnet" {
  source = "../modules/public-subnet"
  // CALL YOUR VARIABLES HERE....
}
module "vpc" {
  source = "../modules/vpc"
  // CALL YOUR VARIABLES HERE....
}
