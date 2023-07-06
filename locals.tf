locals {
  powervs_image_id = [
    for k, v in data.ibm_pi_catalog_images.ds_powervs_image_catalog.images :
    v.image_id if v.name == var.powervs_image_name
  ]
}