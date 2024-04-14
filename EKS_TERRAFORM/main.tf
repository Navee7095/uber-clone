resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::471112501164:role/admin_full_access"  # Replace with your IAM role ARN

  vpc_config {
    subnet_ids         = ["subnet-0fac716e4e1c6c227", "subnet-0021745e2c2b844f2"]  # Replace with your subnet IDs
    security_group_ids = ["sg-0367c3d914d3c67d5"]                         # Replace with your security group IDs
  }

  tags = {
    Environment = "Production"
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = "arn:aws:iam::471112501164:role/admin_full_access"  # Replace with your IAM role ARN
  subnet_ids         = ["subnet-05258f73075fc3d05", "subnet-093c04d40cd777b27"]      # Replace with your subnet IDs

  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 1
  }

  tags = {
    Environment = "Production"
  }
}
