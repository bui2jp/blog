# aws cli

```
aws --version 
aws-cli/2.22.23 Python/3.12.6 Darwin/23.6.0 exe/x86_64
```

```
aws configure
```
認証情報は `~/.aws/credentials` に保存される

確認
```
aws sts get-caller-identity
```

ec2
```
aws ec2 describe-instances

# 作成
aws ec2 run-instances --image-id ami-xxxxxxxx --count 1 --instance-type t2.micro --key-name MyKeyPair --security-groups MySecurityGroup

```

s3
```
aws s3 ls
aws s3 cp <local-file> s3://<bucket-name>/
aws s3 cp s3://<bucket-name>/<file> <local-destination>
```

iam
```
aws iam list-users
aws iam create-user --user-name <user-name>
```


lambda
```
aws lambda create-function --function-name MyLambdaFunction --zip-file fileb://function.zip --handler lambda_function.lambda_handler --runtime python3.8 --role arn:aws:iam::<your-account-id>:role/lambda-ex
```