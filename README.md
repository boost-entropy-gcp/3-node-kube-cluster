This code is made for creating 3node's kubernetes cluster (master + 2 worker nodes) on Gcloud VMs.
Also, you can create optional Grafana vm with prometeus on it.

For using it please do several things.

Creating Gilab environment.

On this project public gitlab server is used. You should do things below:
1. Create in CI/CD settings variable kube_config for storing kube config in the future.
2. Create token for your account. This token will be used  for deploying kube config at initial setup of cluster
3. Create repository for your code



Creating centos VMs for Kubercluster
1. Look at the cluster dir. There you can find all stuff for creating 3 vm in Gcloud. For using it you should add cred.json to this dir. Cred.json is a cred file which you generate in gcloud. 
2. You should change vars.tf with your project_id, region and zone.
3. For using terraform code, you should do terraform init -> terraform plan -> terraform apply and 3 VMs will be created.



Creating 3nodes Kubercluster on vms
1. After the last move you can find IP addresses of your VMs. You can connect to them using ssh and ec2-user login. These IP addresses should be placed to hosts file in kubernetes-ansible/centos directory
2. Add your token and gitlab project id to playbooks/env_variables
3. Run setup_master_node.yml for setting up your master node. You can comment "playbooks/configure_state_metrics.yml" line if you don't want to use optional monitoring vm in your lab system.
4. Run setup_worker_nodes.yml for setting up your worker nodes.
5. Now you can login to you master node and check cluster using "kubectl get nodes command" under root user for testing purposes.


NOW CLUSTER IS READY FOR DEPLOYING SERVICES

OPTIONAL
 
