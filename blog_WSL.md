# WSL (Windows Subsystem for Linux)

## wsl コマンド

```bash
# 起動 (デフォルトで指定されているディストリビューションの起動)
wsl

# 起動（ディストリビューションを指定）
wsl -d <DistributionName>

# ディストリビューションのデフォルトを設定
wsl --set-default <DistributionName>

# インストールされているディストリビューションの一覧を表示
wsl --list --verbose

# ディストリビューションを停止
wsl --terminate <DistributionName>

# すべて停止
wsl --shutdown
```
