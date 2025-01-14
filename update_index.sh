#!/bin/bash

# ファイルパスの設定
INDEX_FILE="./index.md"

# 一時ファイルの作成
TEMP_FILE=$(mktemp)

# index.md の内容を一時ファイルにコピー
cp "$INDEX_FILE" "$TEMP_FILE"

# blog* 形式のファイルを検索
for file in blog*.md; do
  if [ -f "$file" ]; then
    # ファイルの更新日時を取得
    mod_date=$(date -r "$file" +"%Y/%m")
    # ファイルのタイトルを取得
    title=$(grep -m 1 '^# ' "$file" | sed 's/# //')
    # ファイル名を取得
    filename=$(basename "$file")
    # index.md 内にファイル名が存在する場合、その行を更新（更新日とタイトル）
    sed -i "/$filename/c\- $mod_date [$title](./$filename)" "$TEMP_FILE"
  fi
done

# 一時ファイルを index.md に上書き
mv "$TEMP_FILE" "$INDEX_FILE"


