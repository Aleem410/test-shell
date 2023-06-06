source common.sh
yum install python36 gcc python3-devel -y
useradd roboshop
cd /home/roboshop
 curl -L -s -o /tmp/payment.zip "https://github.com/roboshop-devops-project/payment/archive/main.zip"
unzip /tmp/payment.zip
 mv payment-main payment
 curl -L -s -o /tmp/payment.zip "https://github.com/roboshop-devops-project/payment/archive/main.zip"
 unzip /tmp/payment.zip
 mv payment-main payment
 cd /home/roboshop/payment
 pip3 install -r requirements.txt

USER_ID=${id u roboshop}
GROUP_ID=${id g roboshop}


 sed -i -e "/uid c uid = ${USER_ID}/" -e "/uid c gid = ${GROUP_ID}/" /home/robooshop/payment/payment.ini

 sed -i -e 's/CARTHOST/172.31.66.198/' -e 's/USERHOST/172.31.22.94/' -e 's/USERHOST/172.31.22.94/' -e 's/AMQPHOST/172.31.86.220/' /etc/redis.conf /etc/redis/redis.conf

STARTUP