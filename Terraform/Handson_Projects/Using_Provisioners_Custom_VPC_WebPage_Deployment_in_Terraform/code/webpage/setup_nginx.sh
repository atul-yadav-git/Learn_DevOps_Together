#!/bin/bash

# Create the dedicated directory
sudo mkdir -p /var/www/myportfolio

# Move webpage code to the dedicated directory
#sudo mv /home/ec2-user/webpage/* /var/www/myportfolio/

# Move webpage code to the dedicated directory, excluding nginx_setup.sh
sudo find /home/ec2-user/webpage/ -maxdepth 1 -type f ! -name "nginx_setup.sh" -exec mv {} /var/www/myportfolio/ \;


# Create the system user (if not already existing)
sudo useradd -r nginxuser || true


# Set ownership and permissions
sudo chown -R nginxuser:nginxuser /var/www/myportfolio
sudo chmod -R 755 /var/www/myportfolio

echo "Configuration complete! Website files have been moved to /var/www/myportfolio."

# Modify NGINX configuration
sudo sed -i '/server {/,/}/ {
    /root / s@\(root\s\+\)\(.*\)$@\1/var/www/myportfolio;@
}' /etc/nginx/nginx.conf

# Reload NGINX
sudo systemctl reload nginx

# Get current public IP address
public_ip=$(curl -s http://checkip.amazonaws.com)

echo "nginx config modified, and reloaded; visit http://$public_ip:80 "
                 
				 

