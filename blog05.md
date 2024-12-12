# linux コマンド

## cmd > output.txt 2>&1
ファイルディスクリプタ２番の出力先をファイルディスクリプタ１番を複製したものに付け替える
## vi (:set number)
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

# docker コマンド
## docker ps -a
## docker run -it --rm ubuntu
## docker exec -it [containerid] bash
## docker stop [containerid]
## docker rm

## docker images
## docker rmi [imageid]
## docker build -t myapp:v1 .
## docker build -t myapp:v1 --no-cache .
## Dockerfile
```
cat Dockerfile
FROM python:3.11-bullseye

WORKDIR /app

COPY ./ /app

RUN python -m pip install -r requirements.txt

RUN python -m pip install gunicorn

CMD ["python3", "-m", "gunicorn", "-b", "0.0.0.0:8000", "main:app"]
```


# 正規表現（Basic Regular Expressions, BRE）
# 拡張正規表現（ERE）