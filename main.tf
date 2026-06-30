terraform {
  required_version = ">= 1.0"
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.6.0" 
    }
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "~> 0.4.4"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

# 4. Configure Kubernetes Provider to target the new Minikube instance
provider "kubernetes" {
  host                   = minikube_cluster.minikube_local_cluster.host
  client_certificate     = minikube_cluster.minikube_local_cluster.client_certificate
  client_key             = minikube_cluster.minikube_local_cluster.client_key
  cluster_ca_certificate = minikube_cluster.minikube_local_cluster.cluster_ca_certificate
}

provider "minikube" {}
# 3. Provision the Minikube Cluster using Locals
resource "minikube_cluster" "minikube_local_cluster" {
  cluster_name       = local.minikube_cluster_name
  driver             = local.minikube_driver_type
  nodes              = local.minikube_node_count
  kubernetes_version = local.minikube_k8s_version
  
  # Wait until core system components are fully operational
  wait               = ["apiserver", "system_pods"] 
}

provider "kind" {}

resource "kind_cluster" "kind_local_cluster" {
  name           = local.kind_cluster_name
  count          = local.kind_node_count
  wait_for_ready = true

  kind_config {
    kind          = local.kind
    api_version   = local.kind_api_version

    # Control Plane Node
    node {
      role = local.kind_role
 
      extra_port_mappings {
        container_port = local.kind_container_port
        host_port      = local.kind_host_port
        listen_address = local.kind_listen_address
        protocol       = local.kind_protocol
      }
    }
 
    node {
      role = "worker"
    }
  }
}


