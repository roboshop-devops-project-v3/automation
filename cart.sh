dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
rm -rf /app
mkdir /app
useradd roboshop
cp catalogue.service /etc/systemd/system/catalogue.service

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
cd /app
unzip /tmp/catalogue.zip

npm install

systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue
