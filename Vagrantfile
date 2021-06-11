Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu-20.04-amd64'

  config.vm.provider 'libvirt' do |lv, config|
    lv.memory = 512
    lv.cpus = 2
    lv.cpu_mode = 'host-passthrough'
    lv.nested = false # nested virtualization.
    lv.keymap = 'pt'
    lv.storage :file, :size => '5G', :cache => 'unsafe'
    config.vm.synced_folder '.', '/vagrant', type: 'nfs'
  end

  config.vm.hostname = 'parted.test'

  config.vm.provision :shell, path: 'provision-base.sh'
  config.vm.provision :shell, path: 'provision-ansible.sh'
  config.vm.provision :shell, path: 'provision.sh'
end
