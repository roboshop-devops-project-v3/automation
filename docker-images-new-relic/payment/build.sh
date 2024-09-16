rm -rf code 
git clone https://github.com/roboshop-devops-project-v3/payment code
rm -rf code/.git
docker build -t public.ecr.aws/w8x4g9h7/roboshop-v3/payment:newrelic .
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/w8x4g9h7
docker push public.ecr.aws/w8x4g9h7/roboshop-v3/payment:newrelic
