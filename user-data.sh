#!/bin/bash

sudo yum update
sudo yum install -y httpd 
sudo systemctl start httpd
sudo systemctl enable httpd

echo "<h1>Hello from $(curl ifconfig.me)</h1>" >> /var/www/html/index.html