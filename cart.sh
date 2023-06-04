source common.sh
COMPONENT=cart

NODEJS
#PRINT "DOWNLOAD REPO FILE"
#curl -sL https://rpm.nodesource.com/setup_lts.x | bash
#STAT $?
#
#PRINT "INSTALL NODEJS"
#yum install nodejs -y
#STAT $?
#
#PRINT "ADDING USER"
#useradd roboshop
#STAT $?
#
#PRINT "DOWNLOADING ZIP FILE"
#curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip"
#STAT $?
#
#cd /home/roboshop
#unzip /tmp/cart.zip
#mv cart-main cart
#cd cart
#
#PRING "NPM INSTALL"
#npm install
#STAT $?
#
#PRINT "MOVING COMPONENT"
#mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service
#STAT $?
#
#STARTUP

#PRINT "SYSTEM RELOAD"
# systemctl daemon-reload
# STAT $?
#PRINT "START CART"
# systemctl start cart
# STAT $?
#
#PRINT "ENABLE CART"
# systemctl enable cart
# STAT $?