terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "lab_key" {
  name       = "lab-key"
  public_key = file(var.ssh_public_key_path)
}

resource "hcloud_server" "web" {
  name        = var.server_name
  server_type = var.server_type
  image       = "ubuntu-26.04"
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.lab_key.id]

  user_data = file("${path.module}/cloud-init.yaml")

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  firewall_ids = [hcloud_firewall.basic.id]
}
