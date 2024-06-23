dnf install maven -y

rm -rf /app
mkdir /app
useradd roboshop
cp shipping.service /etc/systemd/system/shipping.service

curl -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping-v3.zip
cd /app
unzip /tmp/cart.zip

mnv clean package
mv target/shipping*.jar shipping.jar

systemctl daemon-reload
systemctl enable shipping
systemctl restart shipping

