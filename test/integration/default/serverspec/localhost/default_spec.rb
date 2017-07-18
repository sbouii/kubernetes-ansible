  
  require 'spec_helper'
  require 'common_shared_examples'
  require 'debian_shared_examples'
  require 'redhat_shared_examples'
  
  is_debian_distro = [ 'ubuntu'].include? os[:family]
  is_redhat_distro = ['redhat'].include? os[:family]

  describe "Check Debian specifications", :if => is_debian_distro do
   
   include_examples "check required deb packages"
   include_examples "check debian_installation"
  
  describe "Check Redhat specifications", :if => is_redhat_distro do

   include_examples "check required rpm packages"
   include_examples "check redhat_installation"

  describe "Check setup" do
     
   include_examples "check service "

   include_examples "check cluster_setup"

   inlude_examples "check cluster_connection and  cluster_informations access"

  end
