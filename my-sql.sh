if [ -z "$1" ]
then
  echo PASSWORD is required
  exit
fi
my_sql_password=$1

STAT() {
  if [ "$1" -eq 0 ]
  then
    echo "SUCCESS"
  else
    echo "failure"
    exit
  fi
}
echo dowmload mysql repo
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo
STAT $?

echo disable dnf module
dnf module disable mysql -y
STAT $?

echo install mysql
yum install mysql-community-server -y
STAT $?

echo enable mysql
systemctl enable mysqld
STAT $?

echo start mysql
systemctl start mysqld
STAT $?
echo show databases | mysql -uroot -p${my_sql_password}

if [ $? -ne 0 ]
then
 echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${my_sql_password}';" > /tmp/sql_root_passwd
 DEFAULT_PASSWORD=$(grep 'A temporary password' /var/log/mysqld.log | awk '{print $NF}')
 cat /tmp/sql_root_passwd | mysql --connect-expired-password -uroot -p"${DEFAULT_PASSWORD}"
fi


#echo SECURE INSTALLATION
#mysql_secure_installation
#
#if [ $? -eq 0 ]
#then
#  echo "SUCCESS"
#fi

#echo LOGIN MYSQL
#mysql -uroot -pRoboShop@1
#if [ $? -eq 0 ]
#then
#  echo "SUCCESS"
#fi
#
#echo "show plugins" | mysql -uroot -p${my-sql-password} | grep validate_password
#echo UNISTALL PLUGIN
#
#uninstall plugin validate_password;
#if [ $? -eq 0 ]
#then
#  echo "SUCCESS"
#fi



