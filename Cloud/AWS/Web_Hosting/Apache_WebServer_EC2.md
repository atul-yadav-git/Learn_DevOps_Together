# Deploying Apache on AWS EC2 Instance

## Introduction
This guide outlines the steps to deploy an Apache web server on an AWS EC2 instance, including configuration for hosting a website.

## Deploying an Application using Apache

- Deploy a local application from the local system to AWS EC2.
- Configure CLI access for AWS EC2.
- Clone GitHub repo on AWS EC2 instance.
- Install Apache and start the `httpd` service.
- Ensure the website's files are in the `/var/www/html` directory.
- Configure inbound traffic rules to allow external access.
- Provided public IP and port for accessing the hosted website on AWS EC2.

## Setup and Configuration

### Initial Setup
1. Install Apache on the EC2 instance.
2. Start the Apache service, typically on default port 80.
3. Create a sample `index.html` file in `/var/www/html` for testing.
4. Change ownership of the file to Apache for security reasons.
5. Restart the Apache service.

### Accessibility Configuration
1. Allow inbound traffic on port 80 in the AWS EC2 security group.
2. Modify security group permissions to permit access from your public IP address.
3. Access the website via the EC2 public IP and port 80.

### Changing Default Port
- Changed the default Apache port from 80 to 8083 for enhanced security.

## SSL/TLS Certificate Setup

### Challenges with SSL/TLS
- Obtaining an SSL/TLS certificate is essential for securing HTTPS connections.
- Challenges arise due to the need for a domain name, cost of purchasing a domain, and dynamic IP issues with EC2 instances.

### Redirecting HTTP to HTTPS
- Redirecting HTTP traffic to HTTPS is not possible without a valid SSL/TLS certificate.
- The SSL/TLS handshake occurs before any HTTP data exchange, preventing redirection without a valid certificate.

### Free SSL/TLS Options
- Options like Let's Encrypt offer free SSL/TLS certificates but require a domain name for validation.
- Cloudflare SSL offers flexible SSL but adds an unnecessary layer between the client and server.

### Considerations
- SSL/TLS handshake occurs before HTTP data exchange.
- Browser warnings may occur if SSL certificates are missing or invalid, preventing HTTP requests.

## Conclusion
Deploying Apache on an AWS EC2 instance requires careful configuration of Apache, security group settings, and considerations for SSL/TLS certificates to ensure secure and accessible web hosting.
