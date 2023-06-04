source common.sh
echo INstall NGINX
yum install nginx -y
STAT $?

#echo ENABLE NGINX
#systemctl enable nginx
#STAT $?

#echo START NGINX
#systemctl start nginx
#STAT $?

curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
STAT $?

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/static/* .
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf
#systemctl restart nginx
STARTUP
sed -i -e '/catalogue/ s/localhost/172.31.24.111/' -e '/user/ s/localhost/172.31.22.94/' /etc/nginx/default.d/roboshop.conf