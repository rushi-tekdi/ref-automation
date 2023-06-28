#!/bin/bash

# Update the system
sudo apt update

# Install Nginx
sudo apt install nginx -y

# Configure firewall to allow HTTP and HTTPS traffic
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'

# Backup the default Nginx configuration file
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

# Create the directory for your_domain as follows
sudo mkdir -p /var/www/$your_domain/public


#Create a Index.html file 
#sudo nano /var/www/$your_domain/public/index.html <<EOT
#<html>
#    <head>
#        <title>Welcome to $your_domain!</title>
#    </head>
#    <body>
#        <h1>Success!  The $your_domain server block is working!</h1>
#    </body>
#</html>
#EOT

#Create a index file 
sudo tee /var/www/$your_domain/public/index.html <<EOT
<html>
    <head>
        <title>Welcome to $your_domain!</title>
    </head>
    <body>
        <h1>Success!  The $your_domain server block is working!</h1>
    </body>
</html>

EOT
#create a Nginx config file for the domain name 
sudo tee /etc/nginx/sites-available/$your_domain.conf <<EOT
server {
        listen 80;
        listen [::]:80;

        root /var/www/$your_domain/html;
        index index.html index.htm index.nginx-debian.html;

        server_name $your_domain www.$your_domain;

        location / {
                try_files $uri $uri/ =404;
        }
}

EOT

#Create a Soft Link for the config file
sudo ln -s /etc/nginx/sites-available/$your_domain.conf /etc/nginx/sites-enabled/
