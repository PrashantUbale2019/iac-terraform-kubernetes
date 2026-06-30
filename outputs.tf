 # 5. Define Terraform Outputs
 # Kind Cluster Outputs
 output "kind_cluster_status" {
  description = "Confirmation status of the provisioned cluster"
  value       = "Kind cluster ${local.kind_cluster_name} is successfully provisioned."
}
output "kind_cluster_name" {
  description = "The assigned name of the Kind cluster"
  value       = kind_cluster.kind_local_cluster[*].name
}
output "kubernetes_api_endpoint" {
  description = "The API endpoints for all created KinD clusters"
  value       = kind_cluster.kind_local_cluster[*].endpoint
}

# Minikube Cluster Outputs
output "minikube_cluster_status" {
  description = "Confirmation status of the provisioned cluster"
  value       = "Minikube cluster ${local.minikube_cluster_name} is successfully provisioned."
}
output "minikube_cluster_name" {
  description = "The assigned name of the Minikube cluster"
  value       = minikube_cluster.minikube_local_cluster.cluster_name
}
output "kubernetes_cluster_endpoint" {
  value = minikube_cluster.minikube_local_cluster.host
}