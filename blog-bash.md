# bash

## #!/bin/bash

先頭の `#`はシェルスクリプトの開始を示します。

## ヒアドキュメント

シェルスクリプトの中で複数行の文字列を扱うための方法です。

```bash
#!/bin/bash
cat <<EOF
Hello, World!
This is a here document.
EOF
```
