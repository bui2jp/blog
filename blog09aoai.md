# Azure Open AI
気づいたことをメモ

## 基礎知識
GPT-3.5-Turbo、GPT-4、GPT-4o シリーズのモデルは、会話インターフェイス用に最適化された言語モデルです。

## (API) Azure Open AI と ChatGPT との比較
`pip install openai`  に２つとも含まれている。
APIはよく似ているが、別ものなので変更する場合はソースコードの修正が必要になる。ただし、両方のAPIは非常に似ているため、変更は比較的簡単です。

### ライブラリ
| Azrue Open AI | ChatGPT |
| :--- | :--- |
|> pip install openai<br><br>from openai import AzureOpenAI|> pip install openai<br><br>import openai|

### azure open ai
```
import os
from openai import AzureOpenAI

# Azure OpenAIのクライアントを設定
client = AzureOpenAI(
    api_key=os.getenv("AZURE_OPENAI_API_KEY"),
    api_version="2024-02-01",
    azure_endpoint=os.getenv("AZURE_OPENAI_ENDPOINT")
)

# チャットメッセージを設定
messages = [
    {"role": "system", "content": "You are a helpful assistant."},
    {"role": "user", "content": "Who were the founders of Microsoft?"}
]

# 応答を生成
response = client.chat.completions.create(
    model="gpt-35-turbo",
    messages=messages
)

# 応答を表示
print(response.choices[0].message.content)
```

### chatgpt 
```
import openai

# OpenAI APIキーを設定
openai.api_key = "YOUR_OPENAI_API_KEY"

# チャットメッセージを設定
messages = [
    {"role": "system", "content": "You are a helpful assistant."},
    {"role": "user", "content": "Who were the founders of Microsoft?"}
]

# 応答を生成
response = openai.ChatCompletion.create(
    model="gpt-3.5-turbo",
    messages=messages
)

# 応答を表示
print(response.choices[0].message.content)

```


