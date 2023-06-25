module "new-vpc" {
  source         = "./modules/vpc"
  prefix         = var.prefix
  vpc_cidr_block = var.vpc_cidr_block
}

module "new-eks" {
  source = "./modules/eks"

  prefix             = var.prefix
  cluster_name       = var.cluster_name
  desired_size       = var.desired_size
  log_retention_days = var.log_retention_days
  max_size           = var.max_size
  min_size           = var.min_size
  max_unavailable    = var.max_unavailable

  vpc_id     = module.new-vpc.vpc_id
  subnet_ids = module.new-vpc.subnet_ids
}
