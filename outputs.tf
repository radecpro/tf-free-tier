output "instance_public_ip" {
  value = [
    for instance in google_compute_instance.nginx-web : "http://${instance.network_interface[0].access_config[0].nat_ip}"
  ]
  description = "External IP addresses for the web servers"
}