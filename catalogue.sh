echo DOWNLOAD REPO
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo INSTALL NODEjs
yum install nodejs -y
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo ADDUSER
useradd roboshop
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo downlaod zip file
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi


cd /home/roboshop
unzip /tmp/catalogue.zip
mv catalogue-main catalogue
cd /home/roboshop/catalogue


echo NPM INSTALL
npm install
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

sed -i -e 's/MONGO_DNSNAME/172.31.26.27/' /home/roboshop/catalogue/systemd.service

mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service

echo DAEMON RELOAD
systemctl daemon-reload
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo START catalogue
systemctl start catalogue
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo ENABLE catalogue
systemctl enable catalogue
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi