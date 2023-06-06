SOURCE common.sh
COMPONENT=rabbitmq
RABBITMQ_PASSWORD=$1

PRINT "DOWNLOAD REPO FILE"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | sudo bash
STAT $?

PRINT "INSTALL ERLANG"
yum install erlang -y
STAT $?

PRINT "DOWNLOAD MAVEN REPO"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
STAT $?

PRINT "INSTALL RABBITMQ"
yum install rabbitmq-server -y
STAT $?

PRINT "ENABLE RABBITMQ"
systemctl enable rabbitmq-server
STAT $?

PRINT "START RABBITMQ"
systemctl start rabbitmq-server
STAT $?

 rabbitmqctl add_user roboshop ${RABBITMQ_PASSWORD}
rabbitmqctl set_user_tags roboshop administrator
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"