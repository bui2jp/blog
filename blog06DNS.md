# DNS について

基礎知識

レコード

```
A (ipv4)
AAAA (ipv6)
CNAME (エイリアス)
MX (mail)
NS (Name Server)
TXT
```

## dig (Domain Information Groper)

DNS の問い合わせを行うためのツール

```
# ドメイン名のAレコードを取得
dig example.com

# 特定のDNSレコードを取得（例：MXレコード）
dig example.com NS

# 特定のDNSサーバーを指定して問い合わせ
dig @8.8.8.8 example.com
```

## nslookup

DNS の問い合わせを行うためのツール

```
# ドメイン名のIPアドレスを取得
nslookup example.com

# ドメイン名のNSレコードを取得
nslookup -type=ns example.com

# 特定のDNSサーバーを指定して問い合わせ
nslookup example.com 8.8.8.8
```
