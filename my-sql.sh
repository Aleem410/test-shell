curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi
dnf module disable mysql
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi
yum install mysql-community-server -y
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi
systemctl enable mysqld
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi
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


