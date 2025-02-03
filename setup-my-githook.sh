#!/bin/sh

# hooks ディレクトリから .git/hooks にフックをコピー
cp my-githooks/pre-commit .git/hooks/pre-commit

# gitフックを実行可能にする
chmod +x .git/hooks/pre-commit