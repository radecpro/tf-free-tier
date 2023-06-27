output "instance_public_ip" {
  value       = "http://${google_compute_instance.nginx-web.network_interface[0].access_config[0].nat_ip}"
  description = "External IP address for the web server"
}