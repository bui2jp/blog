# git 関連

## 初期設定

linux での設定(ssh 設定)

```
# sshキーの生成
ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/id_ed25519_github

# SSHエージェントの起動
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_github

# 公開キーをGitHubへ登録
cat ~/.ssh/id_ed25519_github.pub

# リポジトリのクローン
git clone git@github.com:bui2jp/blog.git

```

SSHエージェントの起動は .bashrc へ登録
```
cat ~/.bashrc
:
# sshエージェントの起動
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_github
```
* `eval` コマンドは、引数として渡された文字列をシェルコマンドとして実行します。

## 最低限、習得する

```
git branch
git branch <new branch name>
git branch -D <target branch>
git branch -vv
git branch --set-upstream-to=remote/main main
ブランチのデフォルトのリモートリポジトリを変更する

git checkout <branch name>
git checkout -b <branch name>

git status

git log
git log --oneline --graph
git log --pretty=format:'%h %ad %s'

git add .
git add <filename>

git commit
git commit -m
git commit --amend

git merge
git rebase

git push
git pull
git pull -p リモートで削除されたブランチを削除

git stash
git stash list
git stash apply
git stash pop
git stash drop stash@{0}
git stash clear

git remote
git remote -v
git remote add origin2 git@github.com:bui2jp/blog.git
git remote remove origin2
```

# rebase でのコミット修正について

rebase の２つの主要な機能

```
1. 繋げ直す
2. 纏める
```

失敗したらしたら git rebase --abort  
完了したら git rebase --continue

## rebase でコミットを繋げ直す

```
$ git rebase [main]
```

## rebase で複数のコミットを纏める

```
$ git rebase -i [まとめる地点のひとつ前のID]
```

例

```
$ git rebase -i HEAD~3

pick a5227db 1111
pick dab658f 222
pick b18bf3d 333
pick 900d91a 444

を (squashのsに変更)

pick a5227db 1111
s dab658f 222
s b18bf3d 333
s 900d91a 444

としてコミットメッセージを "rebase12345" とかにすると
69f6caeとなる。rebase12345

% git log --oneline -n 3
69f6cae (HEAD -> dev01) rebase12345
de1e56a (origin/main, origin/HEAD, main) delete dev.txt
d6fd43a Merge pull request #6 from bui2jp/feature/dev1

```

# Merge と Rebase の違い

| ----                   | Merge    | Rebase |
| ---------------------- | -------- | ------ |
| 既存のコミットに影響を | 与えない | 与える |

rebase は共同開発の現場では、他人のコミットを変更してしまう可能性がある。利用する場合注意して。push していない、ローカルの開発内容であれば基本的に Rebase しても問題なし。

# エイリアス　（ショートカット）

設定

```
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
```

確認

```
$ git config --global -l
:
alias.co=checkout
alias.br=branch
alias.ci=commit
alias.st=status
```

# Git リポジトリ（モノ vs マルチ）

コンポーネントごとにリポジトリを作成するか、複数のコンポーネントを一つのリポジトリにまとめるか。

個人的にはマルチのがいいかな。。。軽いので。

# Git フローについて

- プロジェクトのフローやチームの運用方針によって異なる。以下は一般的なものの代表。

| flow name               | 特徴                                       | 主なブランチ                                                                |
| ----------------------- | ------------------------------------------ | --------------------------------------------------------------------------- |
| Git Flow                | 複雑なプロジェクト<br>明確なブランチモデル | main (本番へ deploy)<br>develop<br>feature/\*<br>release/x.y.z<br>hotfix/\* |
| GitHub Flow             | シンプルで小規模                           | main (本番へ deploy)<br>feature/\*                                          |
| GitLab Flow             | GitHub Flow に環境ごとのブランチを追加     | main (本番へ deploy)<br>develop<br>feature/\*<br>staging<br>production      |
| Trunk Based Development | 単一のブランチに直接コミット               | main (本番へ deploy)                                                        |

この blog は、`Trunk Based Development` で運用していると言える。


## 改行コードの設定

- linux : LF
- windows : CRLF

基本的には LF と CRLF を混在させないように。

クロスプラットフォームを意識して LF に統一する。

### core.autocrlf

windows では `input` に設定する。（推奨）

`input` : コミット時にWindows形式（CRLF）をLinux形式（LF）に変換しますが、チェックアウト時には変換しない。

```
git config --global core.autocrlf input
```

## 認証情報のキャッシュ

windows では `wincred` Windows Credential Manager (資格情報マネージャー) に保存される。

https/ssh のどちらかを利用する。
windowsの場合は https が楽かも。

## Github の WEB UI でのコンフリクトの解消時の注意点
GitHubのコンフリクト解消の仕組みは、基本的にはマージコミットを作成して解消する。
さらにGitHubは、作成されたマージコミットをソースブランチ（branch B）に直接プッシュします。
つまり branch B にマージコミットが追加される(Branch B が更新される)。

```
M: マージコミット

   A: --- A1 --- A2 --- M
                  /(マージ操作)
   B: --- B1 --- B2 --- M
```
コンフリクトの解消後 branch A , branch B の状態は同じ M になる。

Branch Bに変更を反映させたくない場合は以下の方法がある。
- ローカル環境でコンフリクトを解消する (推奨される方法)
- リベースを行う

基本的にコンフリクトは少なめに運用することが望ましい。コンフリクトの解消はローカルで行う。

## Git LFS について
Git LFS (Large File Storage) は、Git リポジトリで大きなファイルを効率的に管理するための拡張機能です。Git は通常、すべてのファイルをリポジトリに保存しますが、大きなファイルはリポジトリのサイズを増加させ、パフォーマンスに影響を与える可能性があります。Git LFS を使用すると、大きなファイルを Git リポジトリから分離し、代わりにポインタを保存します。

使い方
* githubではGit LFSを利用する


* Git LFSをインストールする   
  ```
  sudo apt install git-lfs
  ```

* Git LFSを初期化する
  ```
   git lfs install
   ```

* Git LFSで管理するファイルの種類を指定する
   ```
   git lfs track "*.tar.gz"
   git lfs track "*.zip"
   cat .gitattributes
   *.tar.gz filter=lfs diff=lfs merge=lfs -text
   *.zip filter=lfs diff=lfs merge=lfs -text
   ```

* 既存のファイルをGit LFSで管理したい場合は lfs migrate コマンド
   ```
   git lfs migrate import --include="*.tar.gz,*.zip"

   git push -f
   ```

* Git LFSで管理されているファイルを確認する
   ```
   git lfs ls-files
   ```
* Git LFSで管理されているファイルを削除する
   ```
   git lfs untrack "*.tar.gz"
   git rm --cached *.tar.gz
   git commit -m "remove large files"
   ```

* Git LFSで管理されているファイルはポインタだけ取得する
   ```
   GIT_LFS_SKIP_SMUDGE=1 git clone <repository>
   ```
