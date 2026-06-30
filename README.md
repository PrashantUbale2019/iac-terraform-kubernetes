# Infrastructure as Code
## Provision the Kubernetes environment using Terraform
### 1. Create a local cluster with Kind
### 2. Create a local cluster with Minikube
Navigate to infra folder : cd infra and run terraform commands
## Run : terraform init
Initializing provider plugins found in the configuration...
- Reusing previous version of tehcyx/kind from the dependency lock file
- Reusing previous version of scott-the-programmer/minikube from the dependency lock file
- Reusing previous version of hashicorp/kubernetes from the dependency lock file
- Using previously-installed tehcyx/kind v0.6.0
- Using previously-installed scott-the-programmer/minikube v0.4.4
- Using previously-installed hashicorp/kubernetes v3.2.0

Initializing the backend...

Initializing provider plugins found in the state...
- Reusing previous version of tehcyx/kind
- Using previously-installed tehcyx/kind v0.6.0


Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

## Run : terraform validate

Success! The configuration is valid.

## Run : terraform plan
kind_cluster.local_cluster: Refreshing state... [id=cicd-local-cluster-]

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
  + create
  - destroy

Terraform will perform the following actions:

  # kind_cluster.kind_local_cluster[0] will be created
  + resource "kind_cluster" "kind_local_cluster" {
      + client_certificate     = (known after apply)
      + client_key             = (known after apply)
      + cluster_ca_certificate = (known after apply)
      + completed              = (known after apply)
      + endpoint               = (known after apply)
      + id                     = (known after apply)
      + kubeconfig             = (known after apply)
      + kubeconfig_path        = (known after apply)
      + name                   = "cicd-kind-local-cluster"
      + node_image             = (known after apply)
      + wait_for_ready         = true

      + kind_config {
          + api_version = "kind.x-k8s.io/v1alpha4"
          + kind        = "Cluster"

          + node {
              + role = "control-plane"

              + extra_port_mappings {
                  + container_port = 80
                  + host_port      = 80
                  + listen_address = "127.0.0.1"
                  + protocol       = "TCP"
                }
            }
          + node {
              + role = "worker"
            }
        }
    }

  # kind_cluster.local_cluster will be destroyed
  # (because kind_cluster.local_cluster is not in configuration)
  - resource "kind_cluster" "local_cluster" {
      - client_certificate     = <<-EOT
            -----BEGIN CERTIFICATE-----
                    *****
            -----END CERTIFICATE-----
        EOT -> null
      - client_key             = <<-EOT
            -----BEGIN RSA PRIVATE KEY-----
                      *****
            -----END RSA PRIVATE KEY-----
        EOT -> null
      - cluster_ca_certificate = <<-EOT
            -----BEGIN CERTIFICATE-----
                      *****
            -----END CERTIFICATE-----
        EOT -> null
      - completed              = true -> null
      - endpoint               = "https://127.0.0.1:52002" -> null
      - id                     = "cicd-local-cluster-" -> null
      - kubeconfig             = <<-EOT
            apiVersion: v1
            clusters:
            - cluster:
                certificate-authority-data: *****
                server: https://127.0.0.1:52002
              name: kind-cicd-local-cluster
            contexts:
            - context:
                cluster: kind-cicd-local-cluster
                user: kind-cicd-local-cluster
              name: kind-cicd-local-cluster
            current-context: kind-cicd-local-cluster
            kind: Config
            preferences: {}
            users:
            - name: kind-cicd-local-cluster
              user:
                client-certificate-data: *****
                client-key-data: *****
        EOT -> null
      - kubeconfig_path        = "/Users/prashantubale/Documents/GitHub/iac-terraform/cicd-local-cluster-config" -> null
      - name                   = "cicd-local-cluster" -> null
      - wait_for_ready         = true -> null

      - kind_config {
          - api_version               = "kind.x-k8s.io/v1alpha4" -> null
          - containerd_config_patches = [] -> null
          - feature_gates             = {} -> null
          - kind                      = "Cluster" -> null
          - runtime_config            = {} -> null

          - node {
              - kubeadm_config_patches = [] -> null
              - labels                 = {} -> null
              - role                   = "control-plane" -> null
                # (1 unchanged attribute hidden)

              - extra_port_mappings {
                  - container_port = 80 -> null
                  - host_port      = 80 -> null
                  - listen_address = "127.0.0.1" -> null
                  - protocol       = "TCP" -> null
                }
            }
          - node {
              - kubeadm_config_patches = [] -> null
              - labels                 = {} -> null
              - role                   = "worker" -> null
                # (1 unchanged attribute hidden)
            }
        }
    }

  # minikube_cluster.minikube_local_cluster will be created
  + resource "minikube_cluster" "minikube_local_cluster" {
      + apiserver_ips              = (known after apply)
      + apiserver_name             = "minikubeCA"
      + apiserver_names            = (known after apply)
      + apiserver_port             = 8443
      + auto_pause_interval        = 1
      + auto_update_drivers        = true
      + base_image                 = "gcr.io/k8s-minikube/kicbase:v0.0.44@sha256:eb04641328b06c5c4a14f4348470e1046bbcf9c2cbc551486e343d3a49db557e"
      + cache_images               = true
      + cert_expiration            = 1576800
      + client_certificate         = (sensitive value)
      + client_key                 = (sensitive value)
      + cluster_ca_certificate     = (sensitive value)
      + cluster_name               = "cicd-minikube-local-cluster"
      + container_runtime          = "docker"
      + cpus                       = 2
      + delete_on_failure          = false
      + disable_driver_mounts      = false
      + disable_metrics            = false
      + disable_optimizations      = false
      + disk_size                  = "20000mb"
      + dns_domain                 = "cluster.local"
      + dns_proxy                  = false
      + download_only              = false
      + driver                     = "docker"
      + dry_run                    = false
      + embed_certs                = false
      + enable_default_cni         = false
      + extra_disks                = 0
      + force                      = false
      + force_systemd              = false
      + ha                         = false
      + host                       = (known after apply)
      + host_dns_resolver          = true
      + host_only_cidr             = "192.168.59.1/24"
      + host_only_nic_type         = "virtio"
      + hyperkit_vsock_ports       = (known after apply)
      + hyperv_use_external_switch = false
      + id                         = (known after apply)
      + insecure_registry          = (known after apply)
      + install_addons             = true
      + interactive                = true
      + iso_url                    = (known after apply)
      + keep_context               = false
      + kubernetes_version         = "v1.30.0"
      + kvm_gpu                    = false
      + kvm_hidden                 = false
      + kvm_network                = "default"
      + kvm_numa_count             = 1
      + kvm_qemu_uri               = "qemu:///system"
      + memory                     = "4096mb"
      + mount                      = false
      + mount_9p_version           = "9p2000.L"
      + mount_gid                  = "docker"
      + mount_msize                = 262144
      + mount_port                 = 0
      + mount_string               = "/Users:/minikube-host"
      + mount_type                 = "9p"
      + mount_uid                  = "docker"
      + namespace                  = "default"
      + nat_nic_type               = "virtio"
      + native_ssh                 = true
      + nfs_share                  = (known after apply)
      + nfs_shares_root            = "/nfsshares"
      + no_kubernetes              = false
      + no_vtx_check               = false
      + nodes                      = 2
      + output                     = "text"
      + ports                      = (known after apply)
      + preload                    = true
      + registry_mirror            = (known after apply)
      + service_cluster_ip_range   = "10.96.0.0/12"
      + socket_vmnet_client_path   = "/opt/homebrew/opt/socket_vmnet/bin/socket_vmnet_client"
      + socket_vmnet_path          = "/opt/homebrew/var/run/socket_vmnet"
      + ssh_port                   = 22
      + ssh_user                   = "root"
      + vm                         = false
      + wait                       = [
          + "apiserver",
          + "system_pods",
        ]
      + wait_timeout               = 6
    }

Plan: 2 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  + kind_cluster_name           = [
      + "cicd-kind-local-cluster",
    ]
  + kind_cluster_status         = "Kind cluster cicd-kind-local-cluster is successfully provisioned."
  + kubernetes_api_endpoint     = [
      + (known after apply),
    ]
  ~ kubernetes_cluster_endpoint = "https://127.0.0.1:52002" -> (known after apply)
  + minikube_cluster_name       = "cicd-minikube-local-cluster"
  + minikube_cluster_status     = "Minikube cluster cicd-minikube-local-cluster is successfully provisioned."

────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these
actions if you run "terraform apply" now.

## Run : terraform apply --auto-approve
kind_cluster.local_cluster: Refreshing state... [id=cicd-local-cluster-]

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
  + create
  - destroy

Terraform will perform the following actions:

  # kind_cluster.kind_local_cluster[0] will be created
  + resource "kind_cluster" "kind_local_cluster" {
      + client_certificate     = (known after apply)
      + client_key             = (known after apply)
      + cluster_ca_certificate = (known after apply)
      + completed              = (known after apply)
      + endpoint               = (known after apply)
      + id                     = (known after apply)
      + kubeconfig             = (known after apply)
      + kubeconfig_path        = (known after apply)
      + name                   = "cicd-kind-local-cluster"
      + node_image             = (known after apply)
      + wait_for_ready         = true

      + kind_config {
          + api_version = "kind.x-k8s.io/v1alpha4"
          + kind        = "Cluster"

          + node {
              + role = "control-plane"

              + extra_port_mappings {
                  + container_port = 80
                  + host_port      = 80
                  + listen_address = "127.0.0.1"
                  + protocol       = "TCP"
                }
            }
          + node {
              + role = "worker"
            }
        }
    }

  # kind_cluster.local_cluster will be destroyed
  # (because kind_cluster.local_cluster is not in configuration)
  - resource "kind_cluster" "local_cluster" {
      - client_certificate     = <<-EOT
            -----BEGIN CERTIFICATE-----
                      *****
            -----END CERTIFICATE-----
        EOT -> null
      - client_key             = <<-EOT
            -----BEGIN RSA PRIVATE KEY-----
                      *****
            -----END RSA PRIVATE KEY-----
        EOT -> null
      - cluster_ca_certificate = <<-EOT
            -----BEGIN CERTIFICATE-----
                      *****
            -----END CERTIFICATE-----
        EOT -> null
      - completed              = true -> null
      - endpoint               = "https://127.0.0.1:52002" -> null
      - id                     = "cicd-local-cluster-" -> null
      - kubeconfig             = <<-EOT
            apiVersion: v1
            clusters:
            - cluster:
                certificate-authority-data: *****
                server: https://127.0.0.1:52002
              name: kind-cicd-local-cluster
            contexts:
            - context:
                cluster: kind-cicd-local-cluster
                user: kind-cicd-local-cluster
              name: kind-cicd-local-cluster
            current-context: kind-cicd-local-cluster
            kind: Config
            preferences: {}
            users:
            - name: kind-cicd-local-cluster
              user:
                client-certificate-data: *****
                client-key-data: ******
        EOT -> null
      - kubeconfig_path        = "/Users/prashantubale/Documents/GitHub/iac-terraform/cicd-local-cluster-config" -> null
      - name                   = "cicd-local-cluster" -> null
      - wait_for_ready         = true -> null

      - kind_config {
          - api_version               = "kind.x-k8s.io/v1alpha4" -> null
          - containerd_config_patches = [] -> null
          - feature_gates             = {} -> null
          - kind                      = "Cluster" -> null
          - runtime_config            = {} -> null

          - node {
              - kubeadm_config_patches = [] -> null
              - labels                 = {} -> null
              - role                   = "control-plane" -> null
                # (1 unchanged attribute hidden)

              - extra_port_mappings {
                  - container_port = 80 -> null
                  - host_port      = 80 -> null
                  - listen_address = "127.0.0.1" -> null
                  - protocol       = "TCP" -> null
                }
            }
          - node {
              - kubeadm_config_patches = [] -> null
              - labels                 = {} -> null
              - role                   = "worker" -> null
                # (1 unchanged attribute hidden)
            }
        }
    }

  # minikube_cluster.minikube_local_cluster will be created
  + resource "minikube_cluster" "minikube_local_cluster" {
      + apiserver_ips              = (known after apply)
      + apiserver_name             = "minikubeCA"
      + apiserver_names            = (known after apply)
      + apiserver_port             = 8443
      + auto_pause_interval        = 1
      + auto_update_drivers        = true
      + base_image                 = "gcr.io/k8s-minikube/kicbase:v0.0.44@sha256:eb04641328b06c5c4a14f4348470e1046bbcf9c2cbc551486e343d3a49db557e"
      + cache_images               = true
      + cert_expiration            = 1576800
      + client_certificate         = (sensitive value)
      + client_key                 = (sensitive value)
      + cluster_ca_certificate     = (sensitive value)
      + cluster_name               = "cicd-minikube-local-cluster"
      + container_runtime          = "docker"
      + cpus                       = 2
      + delete_on_failure          = false
      + disable_driver_mounts      = false
      + disable_metrics            = false
      + disable_optimizations      = false
      + disk_size                  = "20000mb"
      + dns_domain                 = "cluster.local"
      + dns_proxy                  = false
      + download_only              = false
      + driver                     = "docker"
      + dry_run                    = false
      + embed_certs                = false
      + enable_default_cni         = false
      + extra_disks                = 0
      + force                      = false
      + force_systemd              = false
      + ha                         = false
      + host                       = (known after apply)
      + host_dns_resolver          = true
      + host_only_cidr             = "192.168.59.1/24"
      + host_only_nic_type         = "virtio"
      + hyperkit_vsock_ports       = (known after apply)
      + hyperv_use_external_switch = false
      + id                         = (known after apply)
      + insecure_registry          = (known after apply)
      + install_addons             = true
      + interactive                = true
      + iso_url                    = (known after apply)
      + keep_context               = false
      + kubernetes_version         = "v1.30.0"
      + kvm_gpu                    = false
      + kvm_hidden                 = false
      + kvm_network                = "default"
      + kvm_numa_count             = 1
      + kvm_qemu_uri               = "qemu:///system"
      + memory                     = "4096mb"
      + mount                      = false
      + mount_9p_version           = "9p2000.L"
      + mount_gid                  = "docker"
      + mount_msize                = 262144
      + mount_port                 = 0
      + mount_string               = "/Users:/minikube-host"
      + mount_type                 = "9p"
      + mount_uid                  = "docker"
      + namespace                  = "default"
      + nat_nic_type               = "virtio"
      + native_ssh                 = true
      + nfs_share                  = (known after apply)
      + nfs_shares_root            = "/nfsshares"
      + no_kubernetes              = false
      + no_vtx_check               = false
      + nodes                      = 2
      + output                     = "text"
      + ports                      = (known after apply)
      + preload                    = true
      + registry_mirror            = (known after apply)
      + service_cluster_ip_range   = "10.96.0.0/12"
      + socket_vmnet_client_path   = "/opt/homebrew/opt/socket_vmnet/bin/socket_vmnet_client"
      + socket_vmnet_path          = "/opt/homebrew/var/run/socket_vmnet"
      + ssh_port                   = 22
      + ssh_user                   = "root"
      + vm                         = false
      + wait                       = [
          + "apiserver",
          + "system_pods",
        ]
      + wait_timeout               = 6
    }

Plan: 2 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  + kind_cluster_name           = [
      + "cicd-kind-local-cluster",
    ]
  + kind_cluster_status         = "Kind cluster cicd-kind-local-cluster is successfully provisioned."
  + kubernetes_api_endpoint     = [
      + (known after apply),
    ]
  ~ kubernetes_cluster_endpoint = "https://127.0.0.1:52002" -> (known after apply)
  + minikube_cluster_name       = "cicd-minikube-local-cluster"
  + minikube_cluster_status     = "Minikube cluster cicd-minikube-local-cluster is successfully provisioned."

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

kind_cluster.local_cluster: Destroying... [id=cicd-local-cluster-]
kind_cluster.kind_local_cluster[0]: Creating...
minikube_cluster.minikube_local_cluster: Creating...
kind_cluster.kind_local_cluster[0]: Still creating... [00m10s elapsed]
kind_cluster.local_cluster: Still destroying... [id=cicd-local-cluster-, 00m10s elapsed]
minikube_cluster.minikube_local_cluster: Still creating... [00m10s elapsed]
kind_cluster.local_cluster: Destruction complete after 11s
kind_cluster.kind_local_cluster[0]: Still creating... [00m20s elapsed]
minikube_cluster.minikube_local_cluster: Still creating... [00m20s elapsed]
kind_cluster.kind_local_cluster[0]: Still creating... [00m30s elapsed]
minikube_cluster.minikube_local_cluster: Still creating... [00m30s elapsed]
kind_cluster.kind_local_cluster[0]: Still creating... [00m40s elapsed]
minikube_cluster.minikube_local_cluster: Still creating... [00m40s elapsed]
kind_cluster.kind_local_cluster[0]: Creation complete after 47s [id=cicd-kind-local-cluster-]
minikube_cluster.minikube_local_cluster: Still creating... [00m50s elapsed]
minikube_cluster.minikube_local_cluster: Creation complete after 6m34s [id=cicd-minikube-local-cluster]

Apply complete! Resources: 2 added, 0 changed, 1 destroyed.

Outputs:

kind_cluster_name = [
  "cicd-kind-local-cluster",
]
kind_cluster_status = "Kind cluster cicd-kind-local-cluster is successfully provisioned."
kubernetes_api_endpoint = [
  "https://127.0.0.1:54964",
]
kubernetes_cluster_endpoint = "https://127.0.0.1:55056"
minikube_cluster_name = "cicd-minikube-local-cluster"
minikube_cluster_status = "Minikube cluster cicd-minikube-local-cluster is successfully provisioned."