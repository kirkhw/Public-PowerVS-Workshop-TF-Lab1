# PowerVS public regional endpoints. Currently, the us-east, us-south, eu-de, lon, tor, syd, and tok regions are supported.
# PowerVS private regional endpoints. Currently, the us-east, us-south, eu-de, eu-gb, ca-tor, au-syd, jp-tok, jp-osa, br-sao, and ca-mon regions are supported.
# Region (eg. lon) is needed for network, ssh key etc.
# Zone (eg. lon06) is needed for workspace creation

################################################################
# Module to create new VSI in existing PowerVS workspace
# Pre-reqs:
#   1. PowerVS workspace
#   2. Image is NOT already available (image is imported by Terraform)
#   3. SSH key
################################################################
provider "ibm" {
  ibmcloud_api_key = var.ibm_cloud_api_key
  zone   = var.ibm_cloud_zone
  region = var.powervs_region
}

data "ibm_resource_instance" "ds_powervs_workspace" {
  name     = var.powervs_workspace_name
  service  = "power-iaas"
  location = var.ibm_cloud_zone
}

resource "ibm_pi_network" "powervs_pub_net" {
  pi_cloud_instance_id = data.ibm_resource_instance.ds_powervs_workspace.guid
  pi_network_name      = var.powervs_public_network_name
  pi_network_type      = "pub-vlan"
}

resource "time_sleep" "wait_60_seconds" {

  depends_on = [ ibm_pi_network.powervs_pub_net ]

  create_duration = "60s"
}

data "ibm_pi_network" "ds_powervs_pub_net" {

  depends_on = [time_sleep.wait_60_seconds]

  pi_cloud_instance_id = data.ibm_resource_instance.ds_powervs_workspace.guid
  pi_network_name      = var.powervs_public_network_name
}

data "ibm_pi_catalog_images" "ds_powervs_image_catalog" {
  pi_cloud_instance_id = data.ibm_resource_instance.ds_powervs_workspace.guid
}

resource "ibm_pi_image" "powervc_image_workspace" {

  depends_on = [ data.ibm_pi_network.ds_powervs_pub_net]

  pi_image_name        = var.powervs_image_name
  pi_image_id          = local.powervs_image_id[0]
  pi_cloud_instance_id = data.ibm_resource_instance.ds_powervs_workspace.guid
}


resource "ibm_pi_instance" "new_vsi" {

  depends_on = [time_sleep.wait_60_seconds]

  pi_cloud_instance_id = data.ibm_resource_instance.ds_powervs_workspace.guid
  pi_instance_name     = var.powervs_new_vm_name
  pi_image_id          = ibm_pi_image.powervc_image_workspace.image_id
  pi_key_pair_name     = var.powervs_sshkey_name
  pi_memory            = "6"
  pi_processors        = "2"
  pi_sys_type          = "s922"
  pi_proc_type         = "shared"
  pi_storage_type      = "tier3"
  pi_network {
    network_id = data.ibm_pi_network.ds_powervs_pub_net.id
  }
}