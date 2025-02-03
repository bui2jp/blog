# pip install pyathena
# pip install pandas
# pip install matplotlib
from pyathena import connect
import pandas as pd
import matplotlib.pyplot as plt

# Athenaに接続
conn = connect(
    # s3_staging_dir='s3://your-output-bucket/path/to/query/results/',
    s3_staging_dir='s3://myathenaresult1',
    region_name='ap-northeast-1'
)

# クエリを実行
query = 'SELECT * FROM "default"."my_iot_data3" WHERE message1 LIKE \'%66%\''
# Pandasのデータフレームとして取得
df = pd.read_sql(query, conn)

# 結果を表示
print(df.describe())
print(df.head())
#print(df)


# グラフ表示
# 例として、message1列の値をヒストグラムで表示
df['message1'].value_counts().plot(kind='bar')
plt.xlabel('Message1')
plt.ylabel('Count')
plt.title('Message1 Value Counts')
plt.show()
