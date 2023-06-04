source common.sh
COMPONENT=redis

PRINT "redis repo"
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
STAT $?

PRINT "REDIS MODULE ENABLE"
dnf module enable redis:remi-6.2 -y
STAT $?

PRINT "INSTALL REDIS"
yum install redis -y
STAT $?

sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf /etc/redis/redis.conf

STARTUP
#systemctl enable redis
#STAT $?
#
#systemctl start redis
#STAT $?