for i in catalogue; do
  git clone https://github.com/roboshop-devops-project-v3/$i.git
  rm -rf $i/.git
  zip -r $i.zip $i/*
  aws s3 rm s3://roboshop-artifacts/$i-v3.zip
  aws s3 cp $i.zip s3://roboshop-artifacts/$i-v3.zip
  rm -rf $i*
done
