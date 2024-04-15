resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster-2"
  role_arn = "arn:aws:iam::471112501164:role/uber-access"  # Replace with your IAM role ARN

  vpc_config {
    subnet_ids         = ["subnet-036d61b2205dc884f", "subnet-010b3cbc50713a0da"]  # Replace with your subnet IDs
    security_group_ids = ["sg-0659756effa32fa6d"]                         # Replace with your security group IDs
  }

  tags = {
    Environment = "Production"
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = "arn:aws:iam::471112501164:role/uber-access"  # Replace with your IAM role ARN
  subnet_ids      = ["subnet-036d61b2205dc884f", "subnet-010b3cbc50713a0da"]      # Replace with your subnet IDs

  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 1
}
 tags = {
    Environment = "Production"
  }

}
