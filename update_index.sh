#!/bin/bash

# ファイルパスの設定
INDEX_FILE="./index.md"

# 一時ファイルの作成
TEMP_FILE=$(mktemp)

# index.md の内容を一時ファイルにコピー
cp "$INDEX_FILE" "$TEMP_FILE"

# OSを判定して sed のオプションを設定
if [ "$(uname)" = "Darwin" ]; then
    # macOS
    SED_OPTS="-i ''"
else
    # Linux
    SED_OPTS="-i"
fi

# 特殊文字をエスケープする関数
escape_sed() {
    printf '%s' "$1" | sed 's/[&/\]/\\&/g'
}

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
    
    if [ -n "$title" ] && [ -n "$filename" ]; then
      escaped_title=$(escape_sed "$title")
      escaped_filename=$(escape_sed "$filename")

      # index.md 内にファイル名が存在する場合、その行を更新（更新日とタイトル）
      #sed $SED_OPTS "/$escaped_filename/c\\- $mod_date [$escaped_title](./$escaped_filename)" "$TEMP_FILE"
      # index.md 内にファイル名が存在する場合、その行を更新（更新日とタイトル）
      sed $SED_OPTS "s|$escaped_filename|- $mod_date [$escaped_title](./$escaped_filename)|" "$TEMP_FILE"
    else
      echo "Warning: Skipping file '$file' due to missing title or filename."
    fi
  fi
done

# 個人ブログ (更新日時：yyyy/mm/dd hh24:mi JST)
# titleの更新日時の部分を現在の日時で更新する
sed $SED_OPTS "1s|.*|# blog($(date +'%Y/%m/%d %H:%M JST'))|" "$TEMP_FILE"

# 一時ファイルを index.md に上書き
mv "$TEMP_FILE" "$INDEX_FILE"


