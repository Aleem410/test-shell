echo Download REPO
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo INSTALL MONGO
yum install -y mongodb-org
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo ENABLE MONGO
systemctl enable mongod
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo START MONGo
systemctl start mongod
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo listen IP dchange
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo RESTART MONGO
systemctl restart mongod
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"

cd /tmp
unzip mongodb.zip
cd mongodb-main

echo LOAD SCHEMA
mongo < catalogue.js
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi

echo LOAD SCHEMA USER
mongo < users.js
if [ $? -eq 0 ]
then
  echo "SUCCESS"
fi