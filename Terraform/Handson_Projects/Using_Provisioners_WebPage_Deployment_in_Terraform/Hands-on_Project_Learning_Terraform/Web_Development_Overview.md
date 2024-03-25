# Web Development Technologies Overview

### Table of Contents

1. [Web Servers](#web-servers)
   - [Apache HTTP Server](#apache-http-server)
   - [NGINX](#nginx)
   - [Choosing Between Apache and NGINX](#choosing-between-apache-and-nginx)   
2. [Web Frameworks](#web-frameworks)
   - [Express.js (Node.js)](#expressjs-nodejs)
   - [Django (Python)](#django-python)
   - [Flask (Python)](#flask-python)
   - [Additional Options](#additional-options)   
3. [Front-End Frameworks (JavaScript)](#front-end-frameworks-javascript)
   - [React.js](#reactjs)
   - [Vue.js](#vuejs)   
4. [Back-End Technologies](#back-end-technologies)
   - [Node.js (JavaScript)](#nodejs-javascript)
   - [Django (Python)](#django-python-1)
   - [Flask (Python)](#flask-python-1)
   - [Ruby on Rails (Ruby)](#ruby-on-rails-ruby)
   - [Spring Boot (Java)](#spring-boot-java)   
5. [Setting Up a Simple Website](#setting-up-a-simple-website)
   - [Choosing a Hosting Provider](#choosing-a-hosting-provider)
   - [Hosting on Amazon Linux 2 EC2 Instance](#hosting-on-amazon-linux-2-ec2-instance)   
6. [Installing NGINX on Amazon Linux 2](#installing-nginx-on-amazon-linux-2)   
7. [Important Notes](#important-notes)   
8. [Additional Resources](#additional-resources)

## Web Servers

### Apache HTTP Server

Apache HTTP Server is an open-source web server software renowned for its stability, security, and flexibility. It supports a wide range of features through modules and is highly extensible.

**Typical Use Cases:** 
- Static Website Hosting
- Content Delivery

**Scenarios to Avoid:** 
- High-Concurrency Real-time Applications

### NGINX

NGINX is a lightweight, high-performance web server and reverse proxy server. It excels in handling concurrent connections and static content efficiently.

**Typical Use Cases:** 
- Reverse Proxy
- Load Balancing

**Scenarios to Avoid:** 
- Complex Dynamic Content

### Choosing Between Apache and NGINX

- **Apache:**
  - **Pros:** Widely used, well-documented, beginner-friendly.
  - **Cons:** Can be resource-intensive for high traffic.
- **NGINX:**
  - **Pros:** Known for its high performance and efficiency, especially for serving static content like HTML files. Uses less memory compared to Apache.
  - **Cons:** Configuration syntax might be less intuitive for beginners compared to Apache. Can be less flexible for complex website functionalities requiring modules.

  Note: While NGINX excels in static content and high concurrency, Apache might be preferred for complex configurations with modules.

## Web Frameworks

### Express.js (Node.js)

Express.js is a minimalist web application framework for Node.js, designed for building web applications and APIs quickly and with minimal overhead.

**Typical Use Cases:** 
- API Services
- Real-time Applications

**Scenarios to Avoid:** 
- CPU-Intensive Tasks

### Django (Python)

Django is a high-level Python web framework known for its batteries-included philosophy, offering features like an ORM, admin interface, and robust security features out of the box.

**Typical Use Cases:** 
- Content Management Systems (CMS)
- E-commerce Platforms

**Scenarios to Avoid:** 
- Minimalistic Applications

### Flask (Python)

Flask is a lightweight and flexible Python web framework designed to be simple and easy to use. It offers essential features for web development without imposing any particular project structure.

**Typical Use Cases:** 
- Microservices
- Prototyping and Rapid Development

**Scenarios to Avoid:** 
- Large-scale Applications

### Additional Options

- **Angular.js:** Comprehensive front-end framework suitable for developing enterprise-level web applications with complex requirements.
- **Svelte.js:** A modern JavaScript framework known for its simplicity and efficiency in building reactive web applications.

## Front-End Frameworks (JavaScript)

### React.js

**Practical Use Cases:** 
- Single-page Applications (SPAs)
- Complex User Interfaces

### Vue.js

**Practical Use Cases:** 
- Rapid Prototyping
- Integrating Dynamic UI Components

## Back-End Technologies

### Node.js (JavaScript)

**Practical Use Cases:** 
- Building RESTful APIs
- Real-time Web Applications

### Django (Python)

**Practical Use Cases:** 
- Developing Database-driven Web Applications
- Building Content Management Systems (CMS)

### Flask (Python)

**Practical Use Cases:** 
- Prototyping Small to Medium-sized Web Applications
- Creating RESTful APIs and Microservices

### Ruby on Rails (Ruby)

**Practical Use Cases:** 
- Scalable Web Applications with Rapid Development Cycles
- Developing E-commerce Platforms, Social Networking Sites

### Spring Boot (Java)

**Practical Use Cases:** 
- Developing Enterprise-level Applications with Java
- Building Robust Microservices and Cloud-native Applications

## HTML/CSS/JavaScript 🌐

Foundation of web development for structuring content, styling layouts, and adding interactivity.

**Practical Use Cases:**
- Building static websites and web applications.
- Enhancing user experience with dynamic elements and animations.

## Setting Up a Simple Website

### Choosing a Hosting Provider

- **Free Web Hosting Services:**
  - GitHub Pages
  - Wix.com
  - InfinityFree
- **Benefits of Using a Web Hosting Provider:**
  - Pre-configured Servers
  - Simplified Management
  - Scalability

### Hosting on Amazon Linux 2 EC2 Instance

1. **Setting Up Your EC2 Instance:**
  - Connect to your EC2 instance using SSH.
2. **Install a Text Editor:**
  - Use nano or install vim/emacs.
3. **Create Your Website Files:**
  - HTML, CSS, JavaScript.
4. **Transfer Files to your EC2 Instance:**
  - Use SCP.
5. **Configure Web Server (Optional):**
  - Install NGINX.
6. **Accessing Your Website:**
  - Use the public IP address.
7. **Security Measures:**
  - Implement firewall rules and SSL/TLS encryption.

## Installing NGINX on Amazon Linux 2

```bash
sudo dnf update -y
sudo dnf install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
```
Testing the Configuration:

```bash

sudo nginx -t
```
Reloading NGINX:

```bash

sudo systemctl reload nginx
```
Setting Up Custom HTML Path in NGINX:

```bash

sudo mkdir /var/www/myportfolio
sudo useradd -r nginxuser
sudo chown nginxuser:nginxuser /var/www/myportfolio
sudo chmod 750 /var/www/myportfolio
```
Modifying NGINX Configuration:

```bash

sudo vi /etc/nginx/nginx.conf
```
Restarting NGINX:

```bash

sudo systemctl reload nginx
```
## Important Notes

- Security: Ensure security group settings allow inbound traffic.
- Domain Name (Optional): Consider purchasing a domain name for a professional touch.

## Additional Resources

- [HTML Tutorial](https://www.w3schools.com/html/)
- [CSS Tutorial](https://www.w3schools.com/css/)
- [JavaScript Tutorial](https://www.w3schools.com/js/)
