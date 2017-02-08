  
 shared_examples "check required deb packages" do 
   ['lxc-docker', 'docker.io'].each do |package_depends|
     describe package(package_depends) do 
       it { should be_installed }
     end
   end

   ['kubelet', 'kubeadm', 'kubernetes-cni'].each do |legacy_package|
     describe package(legacy_package) do
       it { should_not be_installed }
     end
   end
  
   describe file('/etc/apt/sources.list.d/kubernetes.list') do
     it { should be_file }
   end
 end
 
 shared_examples "check debian installation" do
     ['kubectl', 'kubeadm', 'kubelet'] do |installed_packages|
       describe package('installed_packages') do
         it { should be_installed }
       end
         
       describe command("[ $(apt-cache policy 'installed_packages' | grep 'Installed' | \
                    awk '{print $NF}') = $(apt-cache policy 'installed_packages' | \
                    grep 'Candidate' | awk '{print $NF}') ]") do
         its(:exit_status) { should eq 0 }
       end
     end
     ['/usr/bin/kubectl', '/usr/bin/kubeadm', '/usr/bin/kubelet'] do |installed_packages_files|

      describe file('installed_packages_files') do
       it { should be_file }
      end
     end
 end

     
