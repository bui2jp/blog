# AWS Athena (SQL)

S3 に保存されたデータに対して SQL を使用してクエリを実行できる

## 料金

スキャンされたデータ量 1TB あたり 5.00 USD が課金されます。

## athenacli

インストール

```bash
pip install athenacli
```

```
$ athenacli
ap-northeast-1:default> show tables;
+--------------+
| tab_name     |
+--------------+
| my_iot_data  |
| my_iot_data2 |
| my_iot_data3 |
+--------------+
3 rows in set
Execution time: 190 ms, Data scanned: 0 B, Approximate cost: $0.00
Time: 0.801s
```

create table

```sql
DROP TABLE my_iot_data;
CREATE EXTERNAL TABLE IF NOT EXISTS `default`.`my_iot_data` (
`message1` string,
`message2` string,
`message3` string,
`message4` int
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
'ignore.malformed.json' = 'FALSE',
'dots.in.keys' = 'FALSE',
'case.insensitive' = 'TRUE',
'mapping' = 'TRUE'
)
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat' OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://my-iot-data/'
TBLPROPERTIES ('classification' = 'json');
```

JOIN も利用可能

古いスタイルの JOIN はそろそろやめたほうがいいかもしれない。

```sql
select a.message1, b.message1, b.message5
from my_iot_data a, my_iot_data2 b
where a.message4 = b.message4 and b.message5 is not null
limit 3;
```

```sql
ap-northeast-1:default> select a.message1, b.message1, b.message5
                        from my_iot_data a join my_iot_data2 b
                        on a.message4 = b.message4
                        where b.message5 is not null
                        limit 3;
+--------------------+--------------------+---------------+
| message1           | message1           | message5      |
+--------------------+--------------------+---------------+
| Hello World!  [58] | Hello World!  [58] | これは5です。 |
| Hello World!  [58] | Hello World!  [58] | これは5です。 |
| Hello World!  [18] | Hello World!  [18] | これは5です。 |
+--------------------+--------------------+---------------+
3 rows in set
Execution time: 2670 ms, Data scanned: 3.28 MB, Approximate cost: $0.00
Time: 3.456s
```

- Data scanned: 3.28 MB に対して課金される。

## パーティション分割

##
