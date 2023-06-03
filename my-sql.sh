curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo
dnf module disable mysql
yum install mysql-community-server -y
systemctl enable mysqld
systemctl start mysqld
grep temp /var/log/mysqld.log
#ALTER USER 'root'@'localhost' IDENTIFIED BY 'RoboShop@1';
#SET PASSWORD FOR 'root'@'localhost' = PASSWORD 'RoboShop@1';
ALTER USER 'root'@'localhost' IDENTIFIED WITH 'RoboShop@1';
