# AWS IAM

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

## ID と権限のライフサイクル管理 (Part2)
