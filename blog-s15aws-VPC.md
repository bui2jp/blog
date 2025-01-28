# AWS VPC (ネットワーク)

## VPC とは

Virtual Private Cloud 仮想ネットワーク
AWS のリソースをプライベートネットワーク上に構築することができるサービス

## VPC

プライベートサブネット
パブリックサブネット
閉域

VPC ウィザード

## セキュリティ Firewalls

セキュリティーグループ = ステートフル Firewall
ネットワーク ACL = ステートレス Firewall (サブネット単位)

## オンプレミスとのハイブリッド構成

- VPN
- Direct Connect (専用線)

## 設計、設定、運用

CIDR ブロック、社内の DC やオフィスと被らないアドレス帯
VPC 内と VPC 外のどちらにリソースやエンドポイントがあるかを意識する
VPC エンドポイントは、S3 や DynamoDB など（グローバル IP をもつサービス）にプライベートな接続を提供する
Gateway 型と PrivateLink 型（有料）がある
VPC 間の接続（ピアリング、Transit Gateway、PrivateLink）

VPC フローログ、VPC Traffic Mirroring

GuardDuty

## その他

Elastic IP の消し忘れに注意。課金される。
