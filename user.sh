source common.sh
COMPONENT=user

NODEJS
#curl -sL https://rpm.nodesource.com/setup_lts.x | bash
#STAT $?
#
#yum install nodejs -y
#STAT $?
#
#useradd roboshop
#STAT $?
#
#curl -s -L -o /tmp/user.zip "https://github.com/roboshop-devops-project/user/archive/main.zip"
#STAT $?
#cd /home/roboshop
#unzip /tmp/user.zip
#mv user-main user
#cd /home/roboshop/user
#npm install
#STAT $?
#
#sed -i -e 's/REDIS_ENDPOINT/localhost/' -e 's/MONGO_ENDPOINT/172.31.26.27/' /home/roboshop/user/systemd.service
#
#mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service
#STARTUP
#systemctl daemon-reload
#STAT $?
#systemctl start user
#STAT $?
#systemctl enable user
#STAT $?