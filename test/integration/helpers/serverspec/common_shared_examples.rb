 
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
           its(:user) { should eq 'root' }
        end
     end 

     describe file('/etc/systemd/system/kubelet.service.d') do 
        it { should be_directory }
     end

     describe service('kubelet') do
        it { should be_enabled }
        it { should be_running.under('systemd') }
     end  
     
     describe process('kubelet') do
        it { should be_running }
        its(:count) { should eq 1 }
        its(:user) { should eq 'root' }

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

   ['10250', '10251', '10252'].each do |kubernetes_allocated_ports|
     describe port(kubernetes_allocated_ports) do
       it { should be_listening }
     end
   end
   ['', '', '', '']
   describe command('kubectl get pods --all-namespaces') do 
     its(:stdout) { should eq 0 }
     its(:stdout) { should contain('running').after('') }
   end

 shared_examples "check cluster_connection and get cluster_informations" do
   
   describe command('curl http://127.0.0.1:8080/version') do
     its(:stdout) { should eq 0 }
     its(:stdout) { should contain('v1.5.1')} 
   end

   describe command('kubectl cluster-info') do
     its(:stdout) { should eq 0 }
     its(:stdout) { should contain('http://localhost:8080') }
   end
  
 end

 shared_examples "check application pods deployment" do
 end

 shared_examples "check monitoring pods deployment"  do
 end
