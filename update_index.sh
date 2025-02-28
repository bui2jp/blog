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
    mod_date=$(git log -1 --format=%cd --date=format:"%Y/%m/%d" -- "$file")
    if [ -z "$mod_date" ]; then
      # mod_dateが空の場合は現在の日付を設定
      mod_date=$(date +"%Y/%m/%d")
    fi
    # ファイルのタイトルを取得
    title=$(grep -m 1 '^# ' "$file" | sed 's/# //')
    # ファイル名を取得
    filename=$(basename "$file")
    # index.md 内にファイル名が存在する場合、その行を更新（更新日とタイトル）
    sed -i "/$filename/c\- $mod_date [$title](./$filename)" "$TEMP_FILE"
  fi
done

# 個人ブログ (更新日時：yyyy/mm/dd hh24:mi JST)
# titleの更新日時の部分を現在の日時で更新する
sed -i "1s|.*|# blog($(date +'%Y/%m/%d %H:%M JST'))|" "$TEMP_FILE"

# 一時ファイルを index.md に上書き
mv "$TEMP_FILE" "$INDEX_FILE"


