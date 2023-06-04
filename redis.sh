source common.sh
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
STAT $?

dnf module enable redis:remi-6.2 -y
STAT $?

yum install redis -y
STAT $?

sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf /etc/redis/redis.conf

STARTUP
#systemctl enable redis
#STAT $?
#
#systemctl start redis
#STAT $?