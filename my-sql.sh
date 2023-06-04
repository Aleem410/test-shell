curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo
dnf module disable mysql
yum install mysql-community-server -y
systemctl enable mysqld
systemctl start mysqld

echo show databases | mysql -uroot -pRoboShop@1
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'RoboShop@1';" > /tmp/sql_root_passwd
DEFAULT_PASSWORD=$(grep 'A temporary password' /var/log/mysqld.log | awk '{print $NF}')
cat /tmp/sql_root_passwd | mysql --connect-expired-password -uroot -p"${DEFAULT_PASSWORD}"


