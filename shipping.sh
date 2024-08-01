dnf install maven mysql -y

rm -rf /app
mkdir /app
useradd roboshop
cp shipping.service /etc/systemd/system/shipping.service

curl -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping-v3.zip
cd /app
unzip /tmp/shipping.zip

mvn clean package
mv target/shipping*.jar shipping.jar
mysql -h mysql-test.rdevopsb79.online -uroot -pRoboShop@1 <db/shipping.sql
mysql -h mysql-test.rdevopsb79.online -uroot -pRoboShop@1 <db/app-user.sql
mysql -h mysql-test.rdevopsb79.online -uroot -pRoboShop@1 <db/schema.sql

systemctl daemon-reload
systemctl enable shipping
systemctl restart shipping

