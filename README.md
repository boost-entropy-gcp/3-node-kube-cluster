This code is made for creating 3node's kubernetes cluster (master + 2 worker nodes) on Gcloud VMs.
Also, you can create optional Grafana vm with prometeus on it.
![alt text](https://user-images.githubusercontent.com/11440569/116749307-6c19f480-aa09-11eb-8cdc-1e53f89b70c3.png)

For using it please do several things.

Creating Gilab environment.

On this project public gitlab server is used. You should do things below:
1. Create in CI/CD settings variable kube_config for storing kube config in the future.
2. Create token for your account. This token will be used  for deploying kube config at initial setup of cluster.
3. Create repository for your code.



Creating centos VMs for Kubercluster.
1. Look at the cluster dir. There you can find all stuff for creating 3 vm in Gcloud. For using it you should add cred.json to this dir. Cred.json is a cred file which you generate in gcloud. 
2. You should change vars.tf with your project_id, region and zone.
3. For using terraform code, you should do terraform init -> terraform plan -> terraform apply and 3 VMs will be created.



Creating 3nodes Kubercluster on vms.
1. After the last move you can find IP addresses of your VMs. You can connect to them using ssh and ec2-user login. These IP addresses should be placed to hosts file in kubernetes-ansible/centos directory.
2. Add your token and gitlab project id to playbooks/env_variables.
3. Run setup_master_node.yml for setting up your master node. You can comment "playbooks/configure_state_metrics.yml" line if you don't want to use optional monitoring vm in your lab system.
4. Run setup_worker_nodes.yml for setting up your worker nodes.
5. Now you can login to you master node and check cluster using "kubectl get nodes command" under root user for testing purposes.


NOW CLUSTER IS READY FOR DEPLOYING SERVICES.

OPTIONAL.

Creating Monitoring (Grafana + Prometheus) VM for your cluster.
1.  Look at the "prom" dir. There you can find all stuff for creating VM used for monitoring. For using it you should add cred.json to this dir. Cred.json is a cred file which you generate in gcloud. 
2. You should change vars.tf with your project_id, region and zone.
3. For using terraform code, you should do terraform init -> terraform plan -> terraform apply and monitoring VM will be created.


Providing Grafana
1. Add IP of the Grafana host to hosts file in kubernetes-ansible/centos directory.
2. Run playbooks/configure_state_metrics.yml if you commented it in the step above. 
3. Run setup_prometheus.yml for setting up grafana node.
4. Grafana's GUI is available at <PUBLIC_IP>:3000 address. You can use admin:admin for logging into interface. Change you password ASAP after starting service.
5. For your kubecluster metrics being available you should make it available outside. I used hack redirecting traffic inside kube-metrics pod with firewalld rules. firewall-cmd --permanent  --add-forward-port=port=4422:proto=tcp:toport=8080:toaddr=<CLUSTER_IP_ADDRESS>.
6. Login to Grafana's GUI and add our prometeus as data sourse for Grafana.
7. Add dashboard for Grafana. As for me, I chose 1860, 13332 and 6417, but You could choose any other dashboard or create your own.


CI/CD part.

For CI/CD purposes I've chosen gitlab.com. In test-project directory you can find helm chart for testing deployment. Yamllint, kubeval and kube-score are used for testing.
1. Copy content of test-project dir to your gitlab's repository.
2. Run pipeline or update gitlab's repository for automated start of .gitlab-ci.yml.
