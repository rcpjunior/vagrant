# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "master" => {"memory" => "512", "cpu" => "1", "ip" => "100", "image" => "generic/ubuntu2004"},
  "node01" => {"memory" => "512", "cpu" => "1", "ip" => "101", "image" => "generic/ubuntu2004"},
  "node02" => {"memory" => "512", "cpu" => "1", "ip" => "102", "image" => "generic/ubuntu2004"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "public_network", bridge: "InternalSwitch", ip: "172.23.0.#{conf["ip"]}"
      machine.vm.provider "hyperv" do |vb|
        vb.vmname = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        
      end
      machine.vm.provision "shell", path: "docker.sh"
      
      if "#{name}" == "master"
        machine.vm.provision "shell", path: "master.sh"
      else
        machine.vm.provision "shell", path: "worker.sh"
      end

    end
  end
end