# linux コマンド

## cmd > output.txt 2>&1
ファイルディスクリプタ２番の出力先をファイルディスクリプタ１番を複製したものに付け替える
## vi (:set number)
```
:%s/apple/orange/g
```
## grep -i "pattern" file.txt
```
拡張正規表現
grep -E '[0-9]+' example.txt
```
## sed 's/old/new/g' file.txt
```
拡張正規表現
sed -E 's/[0-9]+/NUMBER/g' example.txt
```

## awk -F ',' '{print $1, $2+10, $3}' file.txt
```
拡張正規表現
awk -E '/(foo|bar)baz/' example.txt
```
## find
ファイルの検索
```
find . -name "*.md"
./blog02.md
./blog05docker.md
./blog03.md
./README.md
./blog04.md
./blog01.md
./blog05linux.md
./blog06DNS.md
./blog07re.md
```

## xargs
標準入力から受け取ったデータを他のコマンドの引数として渡す
```
echo "aaa bbb ccc" | xargs ls
```

## jq
JSONデータのフィルタリング、変換、集計などを行う
```
# 整形
echo '{"name":"alice","age": 30,"city":"tokyo"}' | jq .
{
  "name": "alice",
  "age": 30,
  "city": "tokyo"
}

# nameを抽出
echo '{"name":"alice","age": 30,"city":"tokyo"}' | jq .name
"alice"

# -r 引用符(")を削除
echo '{"name":"alice","age": 30,"city":"tokyo"}' | jq -r .name
alice
```

## tree -L 2 ./
```
tree -L 1 /
/
├── Applications
├── Library
├── System
├── Users
├── Volumes
├── bin
├── cores
├── dev
├── etc -> private/etc
├── home -> /System/Volumes/Data/home
├── opt
├── private
├── sbin
├── tmp -> private/tmp
├── usr
└── var -> private/var

16 directories, 0 files
```

## top

# network
## ssh, sftp
```
ssh -i <keyfile.pem> username@hostname
```
```
sftp -i <keyfile.pem> username@hostname
```
## telnet
## ping
## ip
## traceroute
## netstat
## net/nbtstat
## dig
## nslookup
## tcpdump
