  
 shared_examples "check service" do
    
     describe file('/var/run/docker.sock') do
        it { should be_socket }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'docker'}
     end

     describe service('docker') do
        it { should be_enabled }
        it { should be_running }
     end
     
     ['dockerd', 'docker-containered'].each do |docker_proc|
        describe process(docker_proc) do
           it { should be_running }
           its(:count) { should eq 1 }
           its(:user) { should eq 'root'}
        end
     end 
 shared_examples "check cluster_setup"do

   ['/etc/kubernetes/admin.conf', '/etc/kubernetes/kubelet.conf'].each do |kubernetes_config_files|
     describe file(kubernetes_config_files) do
       it { should be_file }
     end
   end 

   ['/etc/kubernetes/manifests', '/etc/kubernetes/pki', '/var/lib/kubelet', '/var/lib/etcd'] do |kubernetes_config_directories|
     describe file(kubernetes_config_directories) do
       it { should be_directory }
     end
   end

   ['6443', '8080', '9898', '10250', '10251', '10252', '2379'].each do |kubernetes_allocated_ports|
     describe port(kubernetes_allocated_ports) do
       it { should be_listening }
     end
   end
   


 end
 shared_examples "check cluster_connection" do
 end 
