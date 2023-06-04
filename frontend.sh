source common.sh
COMPONENT=frontend
APP_LOC=/usr/share/nginx/html

PRINT "INstall NGINX"
yum install nginx -y
STAT $?

#echo ENABLE NGINX
#systemctl enable nginx
#STAT $?

#echo START NGINX
#systemctl start nginx
#STAT $?
DOWNLOAD_APP_CODE

#curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip"
#
#STAT $?

#cd /usr/share/nginx/html
#rm -rf *
#unzip /tmp/${COMPONENT}.zip
mv ${COMPONENT}-main/static/* .
mv ${COMPONENT}-main/localhost.conf /etc/nginx/default.d/roboshop.conf

sed -i -e '/catalogue/ s/localhost/172.31.24.111/' -e '/user/ s/localhost/172.31.22.94/' /etc/nginx/default.d/roboshop.conf
#systemctl restart nginx
STARTUP
