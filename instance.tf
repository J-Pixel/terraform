resource "yandex_compute_instance" "default" {
  name        = "test_vm1"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }
  boot_disk {
    initialize_params {
      image_id = "fd87bucsdl9fkg8bi57h"
    }
  }

  network_interface {
    subnet_id = "e9bl34bvmi07oggg05tp"
    nat       = true
  }

  metadata = {
    ssh-keys = "debian:${file("/home/jean/.ssh/id_rsa.pub")}"  #image username:file or raw ssh key. may be viewed in console output.
    serial-port-enable = 1                                     #serial console management option 1=on
  }
}
