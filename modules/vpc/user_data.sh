#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo echo 'Hello from ... Instance' >> /var/www/html/index.html
