echo INstall NGINX
yum install nginx -y
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo ENABLE NGINX
systemctl enable nginx
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo START NGINX
systemctl start nginx
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi


curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/static/* .
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf
systemctl restart nginx

sed -i -e '/catalogue/ s/localhost/172.31.24.111/' -e '/user/ s/localhost/172.31.22.94/' /etc/nginx/default.d/roboshop.conf