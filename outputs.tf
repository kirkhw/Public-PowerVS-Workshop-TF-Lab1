output "vsi_name" {
  description = "VSI name"
  value       = ibm_pi_instance.new_vsi.pi_instance_name
}

output "vsi_OS_type" {
  description = "VSI Operating System Type"
  value       = ibm_pi_instance.new_vsi.os_type
}

output "vsi_external_ip" {
  description = "VSI External IP"
  value       = ibm_pi_instance.new_vsi.pi_network[0].external_ip
}