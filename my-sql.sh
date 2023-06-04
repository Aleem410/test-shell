echo dowmload mysql repo
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo disable dnf module
dnf module disable mysql
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo install mysql
yum install mysql-community-server -y
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo enable mysql
systemctl enable mysqld
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo start mysql
systemctl start mysqld
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo show databases | mysql -uroot -pRoboShop@1

if [ $? -ne 0 ]
then
 echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'RoboShop@1';" > /tmp/sql_root_passwd
 DEFAULT_PASSWORD=$(grep 'A temporary password' /var/log/mysqld.log | awk '{print $NF}')
 cat /tmp/sql_root_passwd | mysql --connect-expired-password -uroot -p"${DEFAULT_PASSWORD}"
fi

echo SECURE INSTALLATION
mysql_secure_installation
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo LOGIN MYSQL
mysql -uroot -pRoboShop@1
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo UNISTALL PLUGIN

uninstall plugin validate_password;
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi



