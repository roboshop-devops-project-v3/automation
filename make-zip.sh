#for i in catalogue user cart frontend shipping payment; do
for i in payment; do
  git clone https://github.com/roboshop-devops-project-v3/$i.git
  rm -rf $i/.git
  cd $i
  zip -r ../$i.zip *
  cd ..
  aws s3 rm s3://roboshop-artifacts/$i-v3.zip
  aws s3 cp $i.zip s3://roboshop-artifacts/$i-v3.zip
  rm -rf $i $i.zip
done

rm -f *.zip
