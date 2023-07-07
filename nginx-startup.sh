#!/bin/bash
sudo apt-get update && sudo apt -y install nginx
sleep 15
sudo gsutil cp gs://${bucket_name}/website/index.html /var/www/html/index.html
sudo gsutil cp gs://${bucket_name}/website/logo.png /var/www/html/logo.png