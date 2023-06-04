source common.sh
COMPONENT=catalogue
NODEJS
#echo DOWNLOAD REPO
#curl -sL https://rpm.nodesource.com/setup_lts.x | bash
#STAT $?
#echo INSTALL NODEjs
#yum install nodejs -y
#STAT $?
#
#echo ADDUSER
#useradd roboshop
#STAT $?
#
#echo downlaod zip file
#curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
#STAT $?
#
#
#cd /home/roboshop
#unzip /tmp/catalogue.zip
#mv catalogue-main catalogue
#cd /home/roboshop/catalogue
#
#
#echo NPM INSTALL
#npm install
#STAT $?
#
#sed -i -e 's/MONGO_DNSNAME/172.31.26.27/' /home/roboshop/catalogue/systemd.service
#
#mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
#
#STARTUP
#echo DAEMON RELOAD
#systemctl daemon-reload
#STAT $?
#
#echo START catalogue
#systemctl start catalogue
#STAT $?
#echo ENABLE catalogue
#systemctl enable catalogue
#STAT $?