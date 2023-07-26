SET GLOBAL validate_password.policy=LOW;
CREATE USER IF NOT EXISTS 'libraryapp'@'%' IDENTIFIED WITH mysql_native_password BY '12345678abc';
-- GRANT ALL PRIVILEGES ON librarydb.* TO 'libraryapp'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON librarydb.* TO 'libraryapp'@'%';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS librarydb;
