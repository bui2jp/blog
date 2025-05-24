# AWS Cloud Watch

## Custom Metrics

ほとんどのモノは標準メトリックでとれるが、システム固有のメトリックについては基本的にCustom Metricsを使うことになる。
使い方・基本を抑えておく。
基本的と思われるものでも標準メトリックに含まれていないものがある。例えばLambdaのタイムアウトやDynamoDBのレコード件数。

aws cli
```
aws cloudwatch put-metric-data \
    --metric-name <metric-name> \
    --namespace <namespace> \
    --value <value>
```

* valueは数値で指定する。文字列は指定できない。
* namespaceはAWSの予約語があるので注意
### 注意事項

* 1 metric あたり0.3USDかかる。これは月額料金。1000メトリックで300USD。別途APIコールなどの費用がかかります。
* 1 metric とは namespace + metric name + dimension の組み合わせのこと。

## Logs Insights QL （クエリ構文）

[クエリ構文](https://docs.aws.amazon.com/ja_jp/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html)

### display 

* 表示するフィールドを指定
* `fields` で指定したフィールドの中から指定する

### fields

* 表示するフィールド、filterするフィールドを指定

### filter

* 正規表現をサポート

### filterIndex

* インデックスが作成されたロググループのみをスキャンする
 indexの作成方法

### source

* webコンソールでは指定できない
* AWS Cli, SDK, API で指定する


### AWS CLIで実行

$0.005 USD/GB（スキャンしたデータ量1GBあたり）

* 実行
```
aws logs start-query \
    --log-group-name <log-group-name> \
    --start-time <start-time> \
    --end-time <end-time> \
    --query-string "<query-string>"
```

* 結果確認
```
aws logs get-query-results \
    --query-id <query-id>
```

シェルにしておく
```
bash <<EOF
aws logs start-query \
    --log-group-name <log-group-name> \
    --start-time <start-time> \
    --end-time <end-time> \
    --query-string "<query-string>" \
    --region <region> \
    --profile <profile>
EOF
