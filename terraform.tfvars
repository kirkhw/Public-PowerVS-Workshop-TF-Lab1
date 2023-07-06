# Variable values
# IBM Cloud PowerVS region [syd,eu-de,lon,us-east,us-south,tor,tok]
powervs_region = "lon"

# IBM Cloud zone [syd04|05, eu-de-1|2, lon04|06, wdc04|06|07, us-east, us-south, dal10|12|13, tor01, tok04, osa21, sao01, mon01]
ibm_cloud_zone = "lon04"

# Name of existing PowerVS workspace to use
powervs_workspace_name = "lab-workspace"

# Existing IBM Cloud resource group name to use
ibm_cloud_resource_group_name = "default"

# Name of new VM to create
powervs_new_vm_name = "lab_vm_1"

# Name of the PowerVS public network to create
powervs_public_network_name = "lab-public-network"

# Name of image to be imported into cloud account from catalog images
# AIX images:  "7300-01-01 | 7300-00-01 | 7200-05-03"
# IBMi images:  "IBMi-75-01-2984-2 | IBMi-74-07-2924-1"
# Linux images: "SLES15-SP4 | RHEL8-SP6"
powervs_image_name = "7300-01-01"

# Name of existing SSH key to use
powervs_sshkey_name = "smc2-sshkey"