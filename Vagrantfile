# -*- mode: ruby -*- # vi: set ft=ruby : BOX = "ubuntu/trusty64" HOST_NAME = "lando"

HOST_NAME = "elk"
BOX = "ubuntu/trusty64"


#### Start Provisioning Script
$provision_script = <<SCRIPT

# Setup ELK
apt-get update
apt-get install -y git unzip curl
wget -P /opt https://github.com/jonbrouse/elk/archive/master.zip
unzip /opt/master.zip -d /opt/
cp /opt/elk-master/logstash/assets/logstash-template.conf /opt/elk-master/logstash/assets/logstash.conf

# Install Docker
wget -qO- https://get.docker.com/ | sh
adduser vagrant docker

# Install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.3.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Seed Logstash with an event
docker-compose up -f /opt/elk-master/docker-compose.yml
sleep 15
echo -e "[Some Log Type][Data] This is our first event!" | nc localhost 24642
docker-compose stop -f /opt/elk-master/docker-compose.yml

# Add Upstart Job to start ELK on boot
cat > /etc/init/elk.conf <<EOF
description "ELK Stack"
author "Jon Brouse @jonbrouse github/jonbrouse"

start on (filesystem and started docker)
stop on runlevel [!2345]

pre-start exec /usr/local/bin/docker-compose -f /opt/elk-master/docker-compose.yml up -d

post-stop exec /usr/local/bin/docker-compose -f /opt/elk-master/docker-compose.yml stop
EOF

SCRIPT


#### Start Vagrant Build
Vagrant.configure("2") do |config|
  config.vm.box= "#{BOX}"
 config.vm.provision "shell", run: "once" do |s|
    s.inline = $provision_script
  end

  config.vm.provider :virtualbox do |vb|
   vb.customize ["modifyvm", :id, "--memory", "3072"]
   vb.customize ["modifyvm", :id, "--cpus", "2"]
   vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end
  config.vm.define "#{HOST_NAME}" do |c|
    c.vm.box = "#{BOX}"
    c.vm.hostname = "#{HOST_NAME}"
    c.vm.network :private_network, type: "dhcp"
    c.vm.network "forwarded_port", guest: 80, host: 80
  end
end
