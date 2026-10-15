Vagrant.configure("2") do |config|
  # Box base
  config.vm.box = "debian/bookworm64"

  # 1. Hostname con mi nombre
  config.vm.hostname = "servidor-Javier"

  # 2. La primera interfaz (NAT) la crea Vagrant de forma predeterminada, no se escribe aquí.
  
  # 3. Segunda interfaz: Red interna de VirtualBox con IP fija.
  # El parámetro 'virtualbox__intnet' fuerza a usar el modo "Red Interna" 
  # en lugar de "Host-only" para aislar la red del anfitrión.
  config.vm.network "private_network", ip: "192.168.56.10", virtualbox__intnet: "red_lab"

  # 4. Reenvío del puerto 80 (Apache en VM) al 8080 (anfitrión) solo por localhost
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # 5. Vinculamos el script Bash de aprovisionamiento
  config.vm.provision "shell", path: "instalar_apache.sh"
end