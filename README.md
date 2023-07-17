## Project Description

Library Management System developed in Spring Boot, JPA, Hibernate, MySQL HTML, CSS, JavaScript.

### What does it offer?

It allows user to manage Members, Categories, Books and Issueing Books.

## Project Setup

### Login to EC2 instance with .pem key

```bash
ssh -i <pem-file> ec2-user@<ip-address>
```

### Install Java and MySQL client app

```bash
sudo dnf install -y mariadb105 java-11-amazon-corretto java-11-amazon-corretto-devel
```

### You can install Maven if you build in EC2

```bash
sudo dnf install -y maven
```

### Install tomcat server

### Run tomcat server in port 80

### Create _librarydb_ database in db host

```bash
mysql -h <host> -P 3306 -u root -p12345678 -e "CREATE DATABASE librarydb"
mysql -h <host> -P 3306 -u root -p12345678 -e "source <db-script.sql>"
```

### Build the application with maven command

```bash
mvn clean package
```

### Run the app in running host

```bash
java -jar target/*.jar
```

### Run the pipeline to automate the deployment

- Setup Jenkins host server.
- Configure necessery tools and plugins for the app.
- Setup credentials for repository and app server.
- Run the pipeline to automate the deployment process.

## Browser app from browser

- Visit <http://ip-address:8080> to access the software from browser.
- Use username 'admin' and password 'admin' for first login.

Thank you.
