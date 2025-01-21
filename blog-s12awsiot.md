# AWS IoT

[AWS IoT Core デベロッパーガイド](https://docs.aws.amazon.com/ja_jp/iot/latest/developerguide/what-is-aws-iot.html) は一通り読んでおく。

[始め方](https://aws.amazon.com/jp/blogs/news/steps-to-learn-aws-iot-for-beginner/)

## 各種サービス

| サービス名                    | 説明                                                                                             |
| ----------------------------- | ------------------------------------------------------------------------------------------------ |
| **AWS IoT Core**              | IoT デバイスをクラウドに接続し、セキュアな通信とデバイス管理を提供するサービス。                 |
| **AWS IoT Greengrass**        | ローカルデバイスで AWS サービスを実行し、データをローカルで処理することができるサービス。        |
| **AWS IoT Analytics**         | IoT デバイスから収集されたデータを分析し、インサイトを得るためのサービス。                       |
| **AWS IoT Device Management** | 大規模な IoT デバイスの管理を簡素化するためのサービス。                                          |
| **AWS IoT Events**            | IoT デバイスからのデータを監視し、特定の条件が満たされたときにアクションをトリガーするサービス。 |
| **AWS IoT SiteWise**          | 産業用機器からデータを収集し、構造化して分析するためのサービス。                                 |
| **AWS IoT Things Graph**      | デバイスとウェブサービスを接続し、IoT アプリケーションを簡単に構築するためのサービス。           |

# Kinesis 3 つのサービス

- Kinesis Data Streams
- Kinesis Data Firehose
- Amazon Managed Service for Apache Flink (旧: Kinesis Data Analytics)

# IoT Core

MQTT メッセージブローカー

- メッセージ編
  トピック、ワイルドカードの利用, メッセージ、QoS0, Qos1, レベル、

* QoS2 はサポートしていない

- プロビジョニング編

- セキュリティー編

- ルールエンジン、デバイスシャドウ編
