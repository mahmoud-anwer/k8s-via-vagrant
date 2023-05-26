# Deploying Kubernetes cluster using Vagrant


## After installing ```Vagrant```.

### Make a directory to create a synced folder and store your persistent data.
    mkdir -p volumes/k8s-data
### and you can edit its path from here.
    master.vm.synced_folder "./volumes/k8s-data", "/k8s-data"
### You can edit IPs or nodes names inside vagrantfile and run this command in the root directory of the repository.
    vagrant up

### On the master node, run this command to get the ```joining command```.
    kubeadm token create  --print-join-command

### On the slave nodes, run the ```joining command``` we have just generated.
    kubeadm join master_node_IP:6443 --token your_token --discovery-token-ca-cert-hash sha256:your_sha256_hashded_token 

#### ```Happy journey```, you have a Kubernetes cluster up and running.
