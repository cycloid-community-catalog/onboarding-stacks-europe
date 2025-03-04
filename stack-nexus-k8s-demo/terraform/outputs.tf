#
# Nexus Repository outputs
#
output "nexus_host" {
  description = "Host where Nexus Repository service is exposed"
  value       = module.nexus.nexus_host
}