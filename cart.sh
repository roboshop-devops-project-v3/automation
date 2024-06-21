dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
rm -rf /app
mkdir /app
useradd roboshop
cp cart.service /etc/systemd/system/cart.service

curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart-v3.zip
cd /app
unzip /tmp/cart.zip

npm install

systemctl daemon-reload
systemctl enable cart
systemctl restart cart

