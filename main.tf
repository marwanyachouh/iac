provider "virtualbox" {
  # Konfiguration för VirtualBox provider
}

resource "virtualbox_vm" "example" {
  name      = "ansible-vm"
  image     = "ubuntu/bionic64"
  cpus      = 2
  memory    = 1024
  network_adapter {
    type    = "hostonly"
    hostonly_adapter = "vboxnet0"
  }
}

output "vm_ip" {
  value = virtualbox_vm.example.network_adapter[0].ipv4_address
}
