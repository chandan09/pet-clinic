module "vpc_network" {
  source = "../../Modules/Network"
  vpc_name  = "Development-VPC"
}

module "web_cluster" {
  source = "../../Modules/compute"
  vpc_id = module.vpc_network.vpc_id  
  private_subnets= module.vpc_network.private_subnets
  public_subnets=module.vpc_network.public_subnets
}
