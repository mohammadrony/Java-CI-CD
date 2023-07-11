# Deploy Java MySQL app with CI/CD Pipeline

A complete project with Jenkins pipeline pulling Github repository to build and deploy in kubernetes cluster.

## Project Description
Library Management System developed in Spring Boot, JPA, Hibernate, MySQL HTML, CSS, JavaScript.

### What does it offer?
It allows user to manage Members, Categories, Books and Issueing Books.

### Project Setup
#### Setup database and run the project
 - Project requires MySql database. Use Xampp
 - Create a database and name it "sparklmsdb".
 - Run the backend from SparkLmsApplication class.
 - After running the backend just hit http://localhost:8080 to access the software.

### Login
for login you may use username as 'admin' and password as 'admin'.

## Run Jenkins pipeline

### Prepare Jenkins server and kubernetes cluster

To run this CI/CD pipeline you need to have a kubernetes cluster and a Jenkins server.

Thank you.