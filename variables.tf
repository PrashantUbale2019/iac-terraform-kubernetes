locals {
  minikube_cluster_name = "cicd-minikube-local-cluster"
  minikube_driver_type  = "docker"
  minikube_node_count   = 2
  minikube_k8s_version  = "v1.30.0"
  kind_cluster_name     = "cicd-kind-local-cluster"
  kind_node_count       = 1
  kind                  = "Cluster"
  kind_api_version      = "kind.x-k8s.io/v1alpha4"
  kind_role             = "control-plane"
  kind_container_port   = 80
  kind_host_port        = 80
  kind_listen_address   = "127.0.0.1"
  kind_protocol         = "TCP"
}