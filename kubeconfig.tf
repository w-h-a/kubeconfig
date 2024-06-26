data "digitalocean_kubernetes_cluster" "do_k8s" {
  count = var.kubernetes == "do" ? 1 : 0
  name  = data.terraform_remote_state.k8s.outputs.cluster_name
}

resource "local_sensitive_file" "do_kubeconfig" {
  count           = var.kubernetes == "do" ? 1 : 0
  content         = data.digitalocean_kubernetes_cluster.do_k8s[count.index].kube_config.0.raw_config
  filename        = "${path.module}/kubeconfig"
  file_permission = "0600"
}
