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

## tree -L 2 ./
## top

# network
## ssh, sftp
## telnet
## ping
## ip
## traceroute
## netstat
## net/nbtstat
## dig
## nslookup
## tcpdump
