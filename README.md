# Deploy Java MySQL app in AWS cloud with CI/CD Pipeline

A complete project with Jenkins pipeline pulling Github repository to build and deploy in Amazon cloud.

## Project Description

Library Management System developed in Spring Boot, JPA, Hibernate, MySQL HTML, CSS, JavaScript.

### What does it offer?

It allows user to manage Members, Categories, Books and Issueing Books.

## Project setup for Amazon Linux

### Login to EC2 instance with .pem key

```bash
ssh -i <pem-file> ec2-user@<ip-address>
```

### Setup Java and MySQL client

#### Install Java and MySQL client app in Amazon linux 2023

```bash
sudo dnf install -y mariadb105 java-11-amazon-corretto java-11-amazon-corretto-devel
```

#### Install Java and MySQL client app in Amazon linux 2

```bash
sudo amazon-linux-extras install java-openjdk11
sudo yum install -y mysql
```

### You can install Maven if you build in EC2

```bash
sudo dnf install -y maven
```

## Prepare database server

### Create user and  database in database host

```bash
mysql -h <host> -P 3306 -u root -p12345678 -e "source <librarydb.sql>"
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
