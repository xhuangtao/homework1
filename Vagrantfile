
#define ips
GO_SERVER_IP="192.168.31.11"
GO_AGENT1_IP="192.168.31.22"
GO_AGENT2_IP="192.168.31.33"


Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"


  config.vm.define "server" do |server|
      server.vm.hostname = "goserver"
      server.vm.network "public_network", ip: GO_SERVER_IP
      server.vm.provider "virtualbox" do |v|
        v.name = "go-server"
        v.memory = 1024
        v.cpus = 2
      end

  end

  config.vm.define "agent1" do |agent1|
      agent1.vm.hostname = "goagent1"
      agent1.vm.network "public_network", ip: GO_AGENT1_IP
      agent1.vm.provider "virtualbox" do |v|
        v.name = "go-agent1"
        v.memory = 1024
      end

  end

  config.vm.define "agent2" do |agent2|
      agent2.vm.hostname = "goagent2"
      agent2.vm.network "public_network", ip: GO_AGENT2_IP
      agent2.vm.provider "virtualbox" do |v|
        v.name = "go-agent2"
        v.memory = 1024
      end

  end

 config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.groups = {
      "servers" => ["server"],
      "agents" => ["agent[1:2]"],
      "agents:vars" => {"goserver_ip" => GO_SERVER_IP}
    }
  end

end
