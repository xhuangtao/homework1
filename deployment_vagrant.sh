###############################################################################
## this is using for  creating and configuring  the Dev/QA environment  autokinetic
## the author: Tony Huang   
## Emal:xhuangtao@126.com
## date: 2017-09-17
## host OS version: ubuntu16
## virtualbox OS version : ubuntu14
###############################################################################

sudo apt-get -y install ruby rubygems  ## install the resouce about ruby
sudo apt-get install vagrant
#  you can also install vagrant from local or internet
# wget https://releases.hashicorp.com/vagrant/1.9.0/vagrant_1.9.0_x86_64.deb ##download the releases of vagrant
# sudo dpkg -i vagrant_1.9.0_x86_64.deb   ##install the vagrant

##########################
#  install  VirtualBox-5.1 
##########################  
sudo apt-get install virtualbox

##########################
# install jdk and tomcat
##########################
sudo apt-get update 
sudo apt-get install python-software-properties  ##add python properties
sudo apt-get install software-properties-common  
sudo add-apt-repository ppa:openjdk-r/ppa   ## make the jdk can be install normally
sudo apt-get update 
sudo apt-get -y install openjdk-8-jdk
sudo apt-get update 
sudo apt-get install tomcat7
