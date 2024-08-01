rm -rf code 
git clone https://github.com/roboshop-devops-project-v3/frontend code 
rm -rf code/.git
docker build -t 973714476881.dkr.ecr.us-east-1.amazonaws.com/roboshop-v3/frontend .
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 973714476881.dkr.ecr.us-east-1.amazonaws.com
docker push 973714476881.dkr.ecr.us-east-1.amazonaws.com/roboshop-v3/frontend
