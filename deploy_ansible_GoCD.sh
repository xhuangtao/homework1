deploy_ansible_GoCD.sh，安装并部署ansible，GoCD等持续集成和持续部署的环境：
 

###############################################################################
## this is using for  creating and configuring  the jenkins  autokinetic
## the author: Tony Huang   
## Emal:xhuangtao@126.com
## date: 2017-09-17
## host OS version: ubuntu16
## virtualbox OS version : ubuntu14
###############################################################################

##########################
#  Define Variables      #
##########################
export MyPath=$1;


###############################################################################
##Usage:
if [ $# -eq 0 ] 
 then
  echo " Unable to find  the Path of the porject , please assign ."
  echo " Please rerun the script as follows:./deployment_host_ubuntu.sh  Path  IP "
  echo " The Path is meaning the location of  Vagrantfile;"  
  echo " eg: ./deployment_host_ubuntu.sh  /opt/my-project "
  exit 1
fi
###############################################################################

##########################
# create dir
########################## 
cd MyPath
mkdir my-vagrant-project
chmod 755  my-vagrant-project
cd my-vagrant-project

##############################
#  generate  the Vagrantfile #
##############################
vagrant init ubuntu/trusty64
vagrant up

#########################################################################
#  update  the Vagrantfile for building the ansible and GoCD from github#
#########################################################################
wget https://raw.githubusercontent.com/xhuangtao/homework1/8b489f05b66adf482f6b017dcfd64ec23274b6d4/Vagrantfile1 
mv Vagrantfile1  Vagrantfile
mkdir ansible
cd ansible
wget  https://raw.githubusercontent.com/xhuangtao/homework1/master/playbook.xml 
sudo apt-get update
vagrant halt
vagrant up

####################################
#  install ansible                 #
#################################### 
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

####################################
#    install goCD                  #
####################################
cd ../
ssh vagrant@192.168.31.11 
wget https://download.gocd.org/binaries/17.10.0-5380/deb/go-server_17.10.0-5380_all.deb 
sudo dpkg -i go-server_17.10.0-5380_all.deb
ssh vagrant@192.168.31.22 
wget https://download.gocd.org/binaries/17.10.0-5380/deb/go-agent_17.10.0-5380_all.deb
sudo dpkg -i go-agent_17.10.0-5380_all.deb
ssh vagrant@192.168.31.33 
wget https://download.gocd.org/binaries/17.10.0-5380/deb/go-agent_17.10.0-5380_all.deb
sudo dpkg -i go-agent_17.10.0-5380_all.deb
