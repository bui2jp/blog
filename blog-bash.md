# bash

## #!/bin/bash

先頭の `#!/bin/bash` はシェルスクリプトの開始を示します。
これはシェルスクリプトがどのシェルで実行されるかを指定するためのものです。`/bin/bash` はBashシェルを指しますが、他のシェル（例えば `/bin/sh` や `/usr/bin/env bash`）を指定することもできます。

## ヒアドキュメント

シェルスクリプトの中で複数行の文字列を扱うための方法です。

```bash
#!/bin/bash
cat <<EOF
Hello, World!
This is a here document.
EOF
```
