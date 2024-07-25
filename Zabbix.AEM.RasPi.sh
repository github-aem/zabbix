wget https://repo.zabbix.com/zabbix/7.0/debian/pool/main/z/zabbix-release/zabbix-release_7.0-2+debian11_all.deb
apt install ./zabbix-release_7.0-2+debian11_all.deb
apt update
apt install zabbix-agent2 zabbix-agent2-plugin-*
sudo cp /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agent2.conf_orig
sudo sed -i -e 's/Server=127.0.0.1/Server=zabbix.aem.green/' /etc/zabbix/zabbix_agent2.conf
sudo sed -i -e 's/ServerActive=127.0.0.1/ServerActive=zabbix.aem.green/' /etc/zabbix/zabbix_agent2.conf
sudo sed -i -e 's/Hostname=Zabbix\ server/#Hostname=Zabbix\ server/' /etc/zabbix/zabbix_agent2.conf
sudo sed -i -e 's/#\ HostnameItem=system.hostname/HostnameItem=system.hostname/' /etc/zabbix/zabbix_agent2.conf
sudo sed -i -e 's/#\ HostMetadata=/HostMetadata=PIES/' /etc/zabbix/zabbix_agent2.conf
sudo sed -i -e 's/#\ HostMetadataItem=/HostMetadataItem=:PIES/' /etc/zabbix/zabbix_agent2.conf
sudo systemctl restart zabbix-agent2
sudo systemctl enable zabbix-agent2
#sudo systemctl status zabbix-agent2
sudo adduser zabbix docker
echo "Zabbix Setup Complete" & hostname

