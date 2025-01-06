# LLM (Llama 3.2 言語モデル)

Meta の LLM。Docker で実行可能。

- ELYZA-japanese-Llama-2-7b 　は日本語での追加学習を行なったバージョン

## ollama

```
docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```
