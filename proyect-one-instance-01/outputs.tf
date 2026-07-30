output "server_ip" {
  value = hcloud_server.web.ipv4_address
}

output "server_ipv6" {
  value = hcloud_server.web.ipv6_address
}
