source common.sh
COMPONENT=mysql
if [ -z "$1" ]
then
  echo PASSWORD is required
  exit
fi
my_sql_password=$1


echo dowmload mysql repo
curl -s -L -o /etc/yum.repos.d/${COMPONENT}.repo https://raw.githubusercontent.com/roboshop-devops-project/${COMPONENT}/main/${COMPONENT}.repo
STAT $?

if [ $? -ne 0 ]
then
echo disable dnf module
dnf module disable mysql
fi
STAT $?

echo install mysql
yum install mysql-community-server -y
STAT $?


#echo enable mysql
#systemctl enable mysqld
#STAT $?
#
#
#echo start mysql
#systemctl start mysqld
#STAT $?
echo show databases | mysql -uroot -p${my_sql_password}

if [ $? -ne 0 ]
then
 echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${my_sql_password}';" > /tmp/sql_root_passwd
 DEFAULT_PASSWORD=$(grep 'A temporary password' /var/log/mysqld.log | awk '{print $NF}')
 cat /tmp/sql_root_passwd | mysql --connect-expired-password -uroot -p"${DEFAULT_PASSWORD}"
fi

echo "show plugins" | mysql -uroot -p${my_sql_password} | grep validate_password
if [ $? -eq 0 ]; then
echo "uninstall plugin validate_password;" | mysql -uroot -p${my_sql_password}
fi
STAT $?


curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip"
cd /tmp
 unzip ${COMPONENT}.zip
 cd ${COMPONENT}-main
 mysql -u root -p${my_sql_password} <shipping.sql
STARTUP
