dnf install gcc python3-devel -y

rm -rf /app
mkdir /app
useradd roboshop
cp payment.service /etc/systemd/system/payment.service

curl -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment-v3.zip
cd /app
unzip /tmp/payment.zip

pip3 -r requirements.txt

systemctl daemon-reload
systemctl enable payment
systemctl restart payment

