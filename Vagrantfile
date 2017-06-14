# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define do |config|
        config.vm.box = "ubuntu/xenial64"

        config.vm.provider "virtualbox" do |v|
            v.gui = false
            v.memory = 1024
            v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        end

        config.vm.synced_folder "sites/", "/var/www/html", type: "nfs", mount_options: ['rw', 'vers=3', 'tcp', 'fsc', 'nolock', 'actimeo=2']
        config.vm.network "private_network", ip: "10.0.0.200"
        config.vm.hostname = "vagrant"

        # Shell provisioning
        config.vm.provision :shell, :path => "shell_provisioner/run.sh"
    end
end