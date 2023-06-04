STAT() {
  if [ "$1" -eq 0 ]
   then
    echo "SUCCESS"
   else
    echo "failure"
    exit
  fi
}

PRINT() {
  echo -e "\e[0;31m$1\e[0m"
}

DOWNLOAD_APP_CODE() {
PRINT "DOWNLOADING ZIP FILE"
  curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip"
  STAT $?

  PRINT "REMOVE PRVIOUS VERSION"
  cd $APP_LOC
    rm -rf *
    STAT $?

  PRINT "EXTRACTING APP CONTENT"
  unzip /tmp/${COMPONENT}.zip
  STAT $?
}
NODEJS() {
  APP_LOC=/home/roboshop
  PRINT "DOWNLOAD REPO FILE"
  curl -sL https://rpm.nodesource.com/setup_lts.x | bash
  STAT $?

  PRINT "INSTALL NODEJS"
  yum install nodejs -y
  STAT $?

  PRINT "ADDING USER"
 if [ $? -ne 0 ]; then
  useradd roboshop
 fi
  STAT $?

  PRINT "DOWNLOADING ZIP FILE"
  curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip"
  STAT $?

  cd /home/roboshop
  rm -rf *
  unzip /tmp/${COMPONENT}.zip
  mv ${COMPONENT}-main cart
  cd ${COMPONENT}

  PRING "NPM INSTALL"
  npm install
  STAT $?

  PRINT "MOVING COMPONENT"
  if [ $? -ne 0 ]; then
  mv /home/roboshop/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
  fi
  STAT $?
  STARTUP
#  PRINT "SYSTEM RELOAD"
#   systemctl daemon-reload
#   STAT $?
#  PRINT "START CART"
#   systemctl start cart
#   STAT $?
#
#  PRINT "ENABLE CART"
#   systemctl enable cart
#   STAT $?
}

STARTUP() {
  PRINT "SYSTEM RELOAD"
   systemctl daemon-reload
   STAT $?
  PRINT "START ${COMPONENT}"
   systemctl start ${COMPONENT}
   STAT $?

  PRINT "ENABLE ${COMPONENT}"
   systemctl enable ${COMPONENT}
   STAT $?
}



