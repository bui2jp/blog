# Sample React SPA

env
```
node -v
v22.13.1
npm -v
10.9.2
```

create spa project
```bash
npx create-react-app my-app-ts --template typescript
npx create-next-app@latest my-nextapp-ts --template typescript
```
create-next-app は next.js project

build
```bash
npm run build
```

## deploy to s3
```bash
MY_BUCKET_NAME=my-spahosting-bucket2025001
# バケットを作成
aws s3 mb s3://$MY_BUCKET_NAME


# パブリックアクセスブロック設定を削除
aws s3api delete-public-access-block --bucket $MY_BUCKET_NAME
# バケットポリシーを設定して、パブリックアクセスを許可
cat my-bucket-policy.json 
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "PublicReadGetObject",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::my-spahosting-bucket2025001/*"
      }
    ]
}
aws s3api put-bucket-policy --bucket $MY_BUCKET_NAME --policy file://my-bucket-policy.json

# 静的ウェブサイトホスティングの設定
aws s3api put-bucket-website --bucket $MY_BUCKET_NAME --website-configuration '{"IndexDocument": {"Suffix": "index.html"}, "ErrorDocument": {"Key": "error.html"}}'

# ファイルをアップロード
cd my-app-ts
aws s3 cp build s3://$MY_BUCKET_NAME --recursive

# ブラウザでアクセスして確認
http://$MY_BUCKET_NAME.s3-website-ap-northeast-1.amazonaws.com/
http://my-spahosting-bucket2025001.s3-website-ap-northeast-1.amazonaws.com/
```