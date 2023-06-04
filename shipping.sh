source common.sh
COMPONENT=shipping

PRINT "INSTALL MAVEN"
yum install maven -y
STAT $?

PRINT "ADDING USER"
 if [ $? -ne 0 ]; then
  useradd roboshop
 fi
  STAT $?

APP_LOC=/home/roboshop
DOWNLOAD_APP_CODE

#cd /home/roboshop
#$ curl -s -L -o /tmp/shipping.zip "https://github.com/roboshop-devops-project/shipping/archive/main.zip"
#$ unzip /tmp/shipping.zip
mv $COMPONENT-main $COMPONENT
cd $COMPONENT
 mvn clean package
 mv target/$COMPONENT-1.0.jar $COMPONENT.jar
