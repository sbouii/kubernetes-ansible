 shared_examples "check required rpm packages" do
  
  describe file('/etc/yum.repos.d/kubernetes.repo') do
    it { should be_file }
  end

 end 
 
 shared_examples "check redhat installation" do
  
