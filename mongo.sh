source common.sh
COMPONENT=mongo

echo Download REPO
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo
STAT $?

echo INSTALL MONGO
yum install -y mongodb-org
STAT $?

#echo ENABLE MONGO
#systemctl enable mongod
#STAT $?
#
#echo START MONGo
#systemctl start mongod
#STAT $?

echo listen IP dchange
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
STAT $?
STARTUP
#echo RESTART MONGO
#systemctl restart mongod
#STAT $?
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"

cd /tmp
unzip mongodb.zip
cd mongodb-main

echo LOAD SCHEMA
${COMPONENT} < catalogue.js
STAT $?

echo LOAD SCHEMA USER
${COMPONENT} < users.js
STAT $?