 shared_examples "check required rpm packages" do
   ['docker', 'docker-client', 'docker-common'].each do |package_depends|
      describe command('yum list installed 'package_depends'') do
        its(:stdout) { should contain('Installed') }
        its(:exit_status) { should eq 0 }
      end   
   end

   ['kubeadm', 'kubectl', 'kubelet', 'kubernetes'].each do |legacy_package|
     describe command('yum list installed 'legacy_package'') do
       its(:stderr) { should match /No matching Packages to list/ }
     end
   end
  describe file('/etc/yum.repos.d/kubernetes.repo') do
    it { should be_file }
  end

 end 
 
 shared_examples "check redhat installation" do
   ['kubectl', 'kubelet', 'kubernetes-cni'].each do |installed_packages|
    describe command('yum list installed | grep kubernetes') do
      its(:stdout) { should contain('installed_packages') }
      its(:exit_status) { should eq 0 }
   end
   ['/usr/bin/kubectl', '/usr/bin/kubeadm', '/usr/bin/kubelet'].each do |installed_packages_files|
    describe file('installed_packages_files') do
      it { should be_file }
     end
   end
 end
