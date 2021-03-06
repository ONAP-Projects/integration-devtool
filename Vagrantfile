# -*- mode: ruby -*-
# vi: set ft=ruby :

configuration = {
  # Generic parameters used across all ONAP components
  'key_name'            => 'ecomp_key',
  'pub_key'             => '',
  'nexus_repo'          => 'https://nexus.onap.org/content/sites/raw',
  'nexus_repo_root'     => 'https://nexus.onap.org',
  'nexus_url_snapshot'  => 'https://nexus.onap.org/content/repositories/snapshots',
  'nexus_docker_repo'   => 'nexus3.onap.org:10001',
  'nexus_username'      => 'docker',
  'nexus_password'      => 'docker',
  'dmaap_topic'         => 'AUTO',
  'artifacts_version'   => '1.0.0',
  'docker_version'      => 'latest',
  # Parameters for DCAE instantiation
  'dcae_zone'           => 'iad4',
  'dcae_state'          => 'vi',
  'openstack_tenant_id' => '',
  'openstack_username'  => '',
  'openstack_api_key'   => '',
  'openstack_password'  => '',
  'odl_version'         => '0.5.3-Boron-SR3',
  # Parameters for enabling features
  'debug'               => 'True',
  'build_image'         => 'True',
  'clone_repo'          => 'True',
  'compile_repo'        => 'False',
  'enable_oparent'      => 'True',
  'skip_get_images'     => 'False',
  'skip_install'        => 'True'
}

box = {
  :virtualbox => { :name => 'elastic/ubuntu-16.04-x86_64', :version => '20180708.0.0' },
  :libvirt => { :name => 'elastic/ubuntu-16.04-x86_64', :version=> '20180210.0.0'},
  :openstack => nil
}

nodes = [
    {
    :name   => "aai",
    :hostname => "aai.hbase.simpledemo.onap.org",
    :ips    => ['10.252.0.6', "192.168.50.6"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 8 * 1024,
    :groups => ["individual"],
    :args   => ["aai"],
    :fwds   => [
      { :guest => 8446, :host => 8446, :guest_ip => '192.168.50.6' },
      { :guest => 9446, :host => 9446, :guest_ip => '192.168.50.6' },
    ]
  },
  {
    :name   => "appc",
    :ips    => ['10.252.0.14', "192.168.50.14"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ["appc"],
  },
  {
    :name   => "ccsdk",
    :ips    => ['10.252.0.19', "192.168.50.19"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ["ccsdk"],
  },
  {
    :name   => "dcae",
    :ips    => ['10.252.0.12', "192.168.50.12"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ["dcae"],
  },
  {
    :name   => "dmaap",
    :ips    => ['10.252.0.22', "192.168.50.22"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ["dmaap"],
  },
  {
    :name   => "dns",
    :ips    => ['10.252.0.3', "192.168.50.3"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 1 * 1024,
    :groups => ["individual"],
    :flavor => 'm1.small',
  },
  {
    :name   => "integration",
    :ips    => ['10.252.0.23', "192.168.50.23"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :flavor => 'm1.small',
    :args   => ["integration"]
  },
  {
    :name   => "message-router",
    :ips    => ['10.252.0.4', "192.168.50.4"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ["mr"],
  },
  {
    :name   => "mso",
    :ips    => ['10.252.0.20', "192.168.50.20"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ["mso"],
  },
  {
    :name   => "msb",
    :ips    => ['10.252.0.7', "192.168.50.7"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ["msb"],
  },
  {
    :name   => "multicloud",
    :ips    => ['10.252.0.16', "192.168.50.16"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ["multicloud"],
    :fwds   => [
      { :guest => 9003, :host => 9003, :guest_ip => '192.168.50.16' },
    ]
  },
  {
    :name   => "oom",
    :ips    => ['10.252.0.21', "192.168.50.21"],
    :macs   => [],
    :cpus   => 32,
    :cpu    => "50",
    :ram    => 128 * 1024,
    :groups => ["individual"],
    :args   => ["oom"],
    :hd     => { :virtualbox => "163840", :libvirt => "160G", },
  },
  {
    :name   => "policy",
    :ips    => ['10.252.0.13', "192.168.50.13"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ["policy"],
  },
  {
    :name   => "portal",
    :ips    => ['10.252.0.11', "192.168.50.11"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ["portal"],
  },
  {
    :name   => "robot",
    :ips    => ['10.252.0.8', "192.168.50.8"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ["robot"],
  },
  {
    :name   => "sdc",
    :ips    => ['10.252.0.5', "192.168.50.5"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 6 * 1024,
    :groups => ["individual"],
    :args   => ["sdc"],
    :hd     => { :virtualbox => "20480", :libvirt => "20G", },
    :fwds   => [
      { :guest => 8285, :host => 8285, :guest_ip => '192.168.50.5' },
    ]
  },
  {
    :name   => "sdnc",
    :ips    => ['10.252.0.10', "192.168.50.10"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ["sdnc"],
  },
  {
    :name   => "testing",
    :ips    => ['10.252.2.3', "192.168.52.3"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["testing"],
    :flavor => 'm1.small',
  },
  {
    :name   => "vfc",
    :ips    => ['10.252.0.15', "192.168.50.15"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ['vfc'],
  },
  {
    :name   => "vid",
    :ips    => ['10.252.0.9', "192.168.50.9"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ['vid'],
  },
  {
    :name   => "vnfsdk",
    :ips    => ['10.252.0.18', "192.168.50.18"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ['vnfsdk'],
  },
  {
    :name   => "vvp",
    :ips    => ['10.252.0.17', "192.168.50.17"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 4 * 1024,
    :groups => ["individual"],
    :args   => ['vvp'],
  },
  {
    :name   => "openstack",
    :ips    => ['10.252.3.3', "192.168.53.3"],
    :macs   => [],
    :cpus   => 2,
    :cpu    => "50",
    :ram    => 8 * 1024,
    :groups => ["individual"],
    :args   => ['openstack'],
    :fwds   => [
      { :guest => 80, :host => 8888, :guest_ip => '192.168.53.4' },
      { :guest => 6080, :host => 6080, :guest_ip => '192.168.53.4' },
    ]
  }
]

run_path   = 'vagrant_utils/postinstall.sh'

Vagrant.require_version ">= 1.8.6"

# Determine the provider used
provider = (ENV['VAGRANT_DEFAULT_PROVIDER'] || :virtualbox).to_sym
puts "[INFO] Provider: #{provider} "

vd_conf = ENV.fetch('VD_CONF', 'etc/settings.yaml')
if File.exist?(vd_conf)
  require 'yaml'
  user_conf = YAML.load_file(vd_conf)
  configuration.update(user_conf)
end

# Set network interface
net_interface = 'vboxnet0'
is_windows = Gem.win_platform?
if is_windows
    net_interface = 'VirtualBox Host-Only Ethernet Adapter #2'
end
puts "[INFO] Net interface: #{net_interface}"


# If argument is given use it. Otherwise use Env: DEPLOY_MODE else use default
requested_machine = ARGV[1]

deploy_mode = ENV.fetch('DEPLOY_MODE', 'individual')
if requested_machine != nil
    if requested_machine.include?("testing")
        deploy_mode = requested_machine
    end
end

# Catch the status of all machines
if ARGV[0] == 'status' || ARGV[0] == 'destroy'
    deploy_mode = 'NA'
end

puts "[INFO] Deploy Mode:  #{deploy_mode}"

# In case of testing clean the nodes list
case deploy_mode
    when 'individual'
        nodes.select! do |node|
            if node[:groups][0].include?("individual")
              true if node[:name]
            end
        end

    when 'testing'
        nodes.select! do |node|
            if node[:name].include?("testing")
              true if node[:name]
            end
        end
end

Vagrant.configure("2") do |config|

    # PROXY definitions
    if ENV['http_proxy'] != nil and ENV['https_proxy'] != nil
      if not Vagrant.has_plugin?('vagrant-proxyconf')
        system 'vagrant plugin install vagrant-proxyconf'
        raise 'vagrant-proxyconf was installed but it requires to execute again'
      end
      config.proxy.enabled = { docker: false }
      config.proxy.http     = ENV['http_proxy']
      config.proxy.https    = ENV['https_proxy']
      configuration['socks_proxy'] = ENV['socks_proxy']
    end

    if Vagrant.has_plugin?('vagrant-vbguest')
      puts 'vagrant-vbguest auto_update feature will be disable to avoid sharing conflicts'
      config.vbguest.auto_update = false
    end

    sync_type = "virtualbox"
    if provider == :libvirt
      if not Vagrant.has_plugin?('vagrant-libvirt')
        system 'vagrant plugin install vagrant-libvirt'
        raise 'vagrant-libvirt was installed but it requires to execute again'
      end
      sync_type = "nfs"
    end

    if provider == :openstack
      config.ssh.username = 'ubuntu'
      if not Vagrant.has_plugin?('vagrant-openstack-provider')
        system 'vagrant plugin install vagrant-openstack-provider'
        raise 'vagrant-openstack-provider was installed but it requires to execute again'
      end
    end

    nodes.each do |node|
      config.vm.define node[:name] do |nodeconfig|

      # NO_PROXY definitions
      if ENV['no_proxy'] != nil or ENV['NO_PROXY']
        $no_proxy = ENV['NO_PROXY'] || ENV['no_proxy'] || "127.0.0.1,localhost"
        $subnet = "192.168.121"
        if provider == :virtualbox
          $subnet = "10.0.2"
        end
        # NOTE: This range is based on vagrant-libvirt network definition CIDR 192.168.121.0/27
        (1..31).each do |i|
          $no_proxy += ",#{$subnet}.#{i}"
        end
        if not Vagrant.has_plugin?('vagrant-proxyconf')
          system 'vagrant plugin install vagrant-proxyconf'
          raise 'vagrant-proxyconf was installed but it requires to execute again'
        end
        config.proxy.no_proxy = node[:ips].join(",") + "," + $no_proxy
      end

        # Common Settings:

        nodeconfig.vm.provider "virtualbox" do |vbox|
          vbox.customize ['modifyvm', :id, '--nictype1', 'virtio']
          vbox.customize ['modifyvm', :id, '--audio', 'none']
          vbox.customize ['modifyvm', :id, '--vram', '1']
          vbox.customize ['modifyvm', :id, "--cpuhotplug", "off"]
          vbox.customize ['modifyvm', :id, "--cpuexecutioncap", node[:cpu]]
          vbox.customize ['modifyvm', :id, "--cpus", node[:cpus]]
          vbox.customize ["modifyvm", :id, "--memory", node[:ram]]

          # Set Network
          nodeconfig.vm.network :private_network,
            :adapter => 2,
            :name => net_interface,
            :ip  => node[:ips][0]

          nodeconfig.vm.network :private_network,
            :adapter => 3,
            :ip  => node[:ips][1],
            :type => :static

          # Set Storage
          if node.has_key? :hd
            volume_file = node[:name] + '-vol1-data.vdi'
            unless File.exist?(volume_file)
              vbox.customize ['createmedium', 'disk', '--filename', volume_file, '--size', node[:hd][provider]]
            end
            vbox.customize ['storageattach', :id, '--storagectl', 'SATAController', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', volume_file]
          end
        end

        nodeconfig.vm.provider "libvirt" do |lbox|
          lbox.memory = node[:ram]
          lbox.nested = true
          lbox.cpu_mode = 'host-passthrough'
          lbox.cpus = node[:cpus]
          lbox.management_network_address = "192.168.121.0/27"

          # Set Network
          nodeconfig.vm.network :private_network,
            :ip  => node[:ips][0]

          nodeconfig.vm.network :private_network,
            :ip  => node[:ips][1],
            :type => :static

          # Set Storage
          if node.has_key? :hd
            lbox.storage :file, bus: 'sata', device: 'sda', size: node[:hd][provider]
          end
        end
        if node.has_key? :fwds
          node[:fwds].each do |fwd|
            nodeconfig.vm.network :forwarded_port,
              :guest => fwd[:guest],
              :guest_ip => fwd[:guest_ip],
              :host => fwd[:host],
              :host_ip => "0.0.0.0"
          end
        end

        nodeconfig.vm.provider :openstack do |obox|
          obox.openstack_auth_url               = ENV.fetch('OS_AUTH_URL', '')
          obox.tenant_name                      = ENV.fetch('OS_TENANT_NAME', '')
          obox.username                         = ENV.fetch('OS_USERNAME', '')
          obox.password                         = ENV.fetch('OS_PASSWORD', '')
          obox.region                           = ENV.fetch('OS_REGION_NAME', '')
          obox.identity_api_version             = ENV.fetch('OS_IDENTITY_API_VERSION', '')
          obox.domain_name                      = ENV.fetch('OS_PROJECT_DOMAIN_ID', '')
          obox.project_name                     = ENV.fetch('OS_PROJECT_NAME', '')
          obox.floating_ip_pool                 = ENV.fetch('OS_FLOATING_IP_POOL', '')
          obox.floating_ip_pool_always_allocate = (ENV['OS_FLOATING_IP_ALWAYS_ALLOCATE'] == 'true')
          obox.image                            = ENV.fetch('OS_IMAGE', '')
          obox.security_groups                  = [ENV.fetch('OS_SEC_GROUP', '')]
          obox.networks                         = ENV.fetch('OS_NETWORK', '')
          obox.flavor                           = node[:flavor]
          obox.server_name                      = node[:name]
        end

        # Set Box type
        nodeconfig.vm.box =  box[provider][:name]
        nodeconfig.vm.box_version = box[provider][:version]

        # Set Node name
        nodeconfig.vm.hostname = if node.has_key? :hostname then node[:hostname] else node[:name] end

        # Set Sync Folder
        nodeconfig.vm.synced_folder ".", "/vagrant", disabled: true
        nodeconfig.vm.synced_folder './opt', '/opt/onap/', create: true, type: sync_type
        nodeconfig.vm.synced_folder './lib', '/var/onap/', create: true, type: sync_type
        if !is_windows
          nodeconfig.vm.synced_folder '~/.m2', '/root/.m2/', create: true
        end

        # Specific settings:

        if node[:name].include? "testing"
            nodeconfig.vm.synced_folder './tests', '/var/onap_tests/', create: true
            test_suite = ENV.fetch('TEST_SUITE', '*')
            test_case = ENV.fetch('TEST_CASE', '*')
            # Override variables
            run_path = 'vagrant_utils/unit_testing.sh'
            node[:args] = [test_suite, test_case]
        else
            configuration['skip_get_images'] = ENV.fetch('SKIP_GET_IMAGES', configuration['skip_get_images'])
            configuration['skip_install'] = ENV.fetch('SKIP_INSTALL', configuration['skip_install'])
        end

        if node[:name].include? "vfc"
          nodeconfig.vm.provision 'docker'
        end

        nodeconfig.vm.provision 'shell' do |s|
          s.path = run_path
          if node.has_key? :args
            s.args = node[:args]
          end
          s.env  = configuration
        end

      end #nodeconfig
    end #node
end #config
