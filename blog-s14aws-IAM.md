# AWS IAM

ベストプラクティス

youtube

```
AWS Identity and Access Management (AWS IAM) Part1
AWS Identity and Access Management (AWS IAM) Part2
```

認証と認可の仕組みを提供するサービス

## 用語

プリンシパル : ユーザー、グループ、ロール、アプリケーションなど
ルートユーザー : なるべく利用しない。IAM ユーザーを作成して利用する。
IAM ユーザー : AWS リソースにアクセスするためのユーザー
ARN(Amazon Resource Name) : リソースを一意に識別するための名前
CloudTrail : AWS アカウントで行われた操作を記録するサービス

## ID と認証情報の管理 (Part1)

- ルートユーザーを利用しない
- IAM ユーザーを利用する
- アクセスキーを共有しない
- 特権ユーザーには MFA を設定する

## アクセス権限の管理 (Part1)

- ポリシーオブジェクトを作成してプリンシパルに関連づける、アクセス許可
  　ポリシー　管理ポリシー（AWS 管理、カスタマー管理）
  　　　　　　インラインポリシー（IAM エンティティに直接埋め込む）

- ポリシー条件 (ポリシードキュメント)

```
Principal : ポリシーが適用される対象
Action : ポリシーが許可するアクション
Resource : ポリシーが適用されるリソース
Condition : ポリシーが適用される条件
```

- 最小権限を付与する

- グループを利用して権限管理

## 権限の委任 (Part2)

- IAM ロールを使用する　クレデンシャルの漏洩防止
- STS(Security Token Service) の利用　一時的なセキュリティ認証情報を提供

- CloudTrail の利用　 AWS アカウントで行われた操作を記録

## ID と権限のライフサイクル管理 (Part2)

- アクティビティの監視

AWS CloudTrail, AWS CloudWatch, AWS Config, AWS CloudFront などを活用する

- アクセスレベル (List, Read, Write, Permissions) の管理
  アクセスアドバイザー
  IAM ポリシーを定期的に確認

- 不要な認証情報の削除
  credential report (認証情報レポート)　ポータルから作成できる

- 認証情報の定期的なローテーション
  アクセスキーもローテーションの対象にする

ライフサイクル管理

# IAM Tips

基本の設定
初期設定
グループを活用しよう(AllUsers, Admin, Developer, Manager)
