cp mongo.repo /etc/yum.repos.d/mongo.repo
dnf install -y mongodb-org
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
systemctl enable mongod
systemctl restart mongod
