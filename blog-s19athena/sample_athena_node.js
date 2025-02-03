const {
  AthenaClient,
  StartQueryExecutionCommand,
  GetQueryExecutionCommand,
  GetQueryResultsCommand,
} = require("@aws-sdk/client-athena");

// AWS SDKの設定
const client = new AthenaClient({ region: "ap-northeast-1" });

const query =
  'SELECT * FROM "default"."my_iot_data3" WHERE message1 LIKE \'%66%\'';
const params = {
  QueryString: query,
  ResultConfiguration: {
    OutputLocation: "s3://myathenaresult1/",
  },
  QueryExecutionContext: {
    Database: "default",
  },
};

// クエリを実行
const startQuery = async () => {
  try {
    const data = await client.send(new StartQueryExecutionCommand(params));
    const queryExecutionId = data.QueryExecutionId;

    // クエリのステータスをポーリングして確認
    const checkQueryStatus = async () => {
      const statusParams = { QueryExecutionId: queryExecutionId };
      const statusData = await client.send(
        new GetQueryExecutionCommand(statusParams)
      );
      const status = statusData.QueryExecution.Status.State;

      if (status === "SUCCEEDED") {
        // クエリ結果を取得
        const getResultParams = { QueryExecutionId: queryExecutionId };
        const resultData = await client.send(
          new GetQueryResultsCommand(getResultParams)
        );

        // 結果を処理して表示
        const rows = resultData.ResultSet.Rows;
        const headers = rows[0].Data.map((d) => d.VarCharValue);
        const results = rows.slice(1).map((row) => {
          const obj = {};
          row.Data.forEach((d, i) => {
            obj[headers[i]] = d.VarCharValue;
          });
          return obj;
        });

        console.log(results);
      } else if (status === "FAILED" || status === "CANCELLED") {
        console.error(`Query failed or was cancelled. Status: ${status}`);
      } else {
        // クエリが完了していない場合、再度ステータスを確認
        setTimeout(checkQueryStatus, 1000); // 1秒後に再度確認
      }
    };

    checkQueryStatus();
  } catch (err) {
    console.error(err);
  }
};

startQuery();
