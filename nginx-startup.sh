#!/bin/bash
sudo apt-get update && sudo apt -y install nginx
sleep 15
sudo gsutil cp gs://${bucket_name}/index.html /var/www/html/index.html
sudo gsutil cp gs://${bucket_name}/logo.png /var/www/html/logo.png