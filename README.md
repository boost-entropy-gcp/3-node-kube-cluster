This code is made for creating 3node's kubernetes cluster (master + 2 worker nodes) on Gcloud VMs.
Also, you can create optional Grafana vm with prometeus on it.

For using it please do several things.

Creating VMs for Kubercluster
1. Look at the cluster dir. There you can find all stuff for creating 3 vm in Gcloud. For using it you should add cred.json to this dir. Cred.json is a cred file which you generate in gcloud. 
2. You should change vars.tf with your project_id, region and zone.
3. For using terraform code, you should do terraform init -> terraform plan -> terraform apply and 3 VMs will be created.

Creating  
