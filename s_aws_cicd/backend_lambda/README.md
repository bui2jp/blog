# Sample Lambda Function

env
```
aws --version 
aws-cli/2.24.5 Python/3.12.6 Linux/5.15.167.4-microsoft-standard-WSL2 exe/x86_64.ubuntu.24

# serverless application model
sam --version 
SAM CLI, version 1.133.0

node -v
v22.13.1
npm -v
10.9.2
```

## lambda function
```bash
sam init --runtime nodejs22.x --name my-lambda-hello
sam deploy --guided
# デプロイ完了後に表示されるURLにアクセスして動作確認
curl https://xxxxxxxxxx.execute-api.ap-northeast-1.amazonaws.com/Prod/hello
```

## local test
```
sam build
sam local invoke
sam local start-api
```

## 変更のデプロイ

```bash
# ソースの変更・動作確認後にビルドしてデプロイ
sam build
sam deploy --no-confirm-changeset
```

課題
```
npm run buildができない。。。
```