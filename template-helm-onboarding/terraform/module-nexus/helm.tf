resource "helm_release" "nexus" {
  name       = "nexus"
  repository = "https://sonatype.github.io/helm3-charts"
  chart      = "nexus-repository-manager"

  set {
    name  = "nexus.nexusPort"
    value = "${var.nexus_port}"
  }

  set {
    name  = "persistence.storageSize"
    value = "${var.vm_disk_size}Gi"
  }

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}
