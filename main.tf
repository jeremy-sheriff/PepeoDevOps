module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
}


module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id

  cidr_block_a = var.subnet_a_cidr_block // first subnet
  cidr_block_b = var.subnet_b_cidr_block // second subnet

  availability_zone_a = var.availability_zone_a // first availability zone
  availability_zone_b = var.availability_zone_b // second availability zone
}

module "route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.internet_gateway_id
  subnet_a = module.subnet.public_a_id
  subnet_b = module.subnet.public_b_id
}



module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  description = "API Security Group"
  subnets_cidr_block_a = module.subnet.public_a_cidr_block
  subnets_cidr_block_b = module.subnet.public_b_cidr_block
}

module "target_group" {
  source = "./modules/target_group"

  name                      = "api-target-group"
  port                      = 80
  protocol                  = "HTTP"
  vpc_id                    = module.vpc.vpc_id
}

module "iam_roles" {
  source = "./modules/iam_roles"
}

module "cloudwatch" {
  source = "./modules/cloudwatch_logs"
  logName = "ecs/api"
}

module "alb" {
  source = "./modules/alb"
  name                     = "pepeo-app-load-balancer"
  internal                 = false
  security_groups          = [module.security_groups.alb_security_group]
  subnets                  = [module.subnet.public_a_id, module.subnet.public_b_id]
  enable_deletion_protection = false
  idle_timeout             = 60
  load_balancer_type = var.load_balancer_type
  api_target_group_arn = module.target_group.api_target_group_arn
}


module "ecs_cluster" {
  source = "./modules/ecs_cluster"
  cluster_name = "DevCluster"

  SECURITY_GROUPS = [module.security_groups.api_security_group]
  SUBNET_ID = [module.subnet.public_a_id]
  TARGET_GROUP_ARN = module.target_group.api_target_group_arn
  region = var.region
  CLUSTER_ID = module.ecs_cluster.cluster_id
  API_IMAGE  = ""
  taskExecutionRole = module.iam_roles.ecs_task_execution_role_arn
}