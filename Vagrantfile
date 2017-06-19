# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define :nu do |nu_config|
        nu_config.vm.box = "ubuntu/trusty64"

        nu_config.vm.provider "virtualbox" do |v|
            v.gui = false
            v.memory = 2048
            v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        end

        nu_config.vm.synced_folder "sites/", "/var/www/html", type: "nfs", mount_options: ['rw', 'vers=3', 'tcp', 'fsc', 'nolock', 'actimeo=2']
        nu_config.vm.network "private_network", ip: "10.0.0.200"
        nu_config.vm.hostname = "vagrant"

        # Shell provisioning
        nu_config.vm.provision :shell, :path => "shell_provisioner/run.sh"
    end
end