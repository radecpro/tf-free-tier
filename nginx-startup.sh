#!/bin/bash
sudo apt-get update && sudo apt -y install nginx
echo '<!doctype html><html><body><h1>Hello World with Terraform!</h1></body></html>' | sudo tee /var/www/html/index.html