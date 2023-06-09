source common.sh
COMPONENT=shipping
APP_LOC=/home/roboshop

PRINT "INSTALL MAVEN"
yum install maven -y
STAT $?

PRINT "ADDING USER"
id roboshop
 if [ $? -ne 0 ]; then
  useradd roboshop
 fi
 STAT $?

DOWNLOAD_APP_CODE

#cd /home/roboshop
#$ curl -s -L -o /tmp/shipping.zip "https://github.com/roboshop-devops-project/shipping/archive/main.zip"
#$ unzip /tmp/shipping.zip
#PRINT "COMPONENT"
mv ${COMPONENT}-main ${COMPONENT}
STAT $?

PRINT "ENTER"
cd ${COMPONENT}
STAT $?

PRINT "MVN CLEAN"
mvn clean package
STAT $?

mv target/${COMPONENT}-1.0.jar ${COMPONENT}.jar

sed -i -e 's/CARTENDPOINT/172.31.66.198/' -e 's/DBHOST/172.31.86.220/' /home/roboshop/shipping/systemd.service

 mv /home/roboshop/shipping/systemd.service /etc/systemd/system/shipping.service
STARTUP
