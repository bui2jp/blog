# E2E Test Playwright

[official docker](https://playwright.dev/docs/docker)

## Docker
```
docker pull mcr.microsoft.com/playwright:v1.50.1-noble
```

run
```
# ローカルへの保存対象
cd my-playwright-work
# e2c, test-results ディレクトリをマウントしてローカルに保存
# *このフォルダ名は playwright のデフォルト
mkdir tests playwright-report

# コンテナ起動
docker run -it --rm \
    -v $(pwd):/my-playwright-work \
    -w /my-playwright-work --ipc=host mcr.microsoft.com/playwright:v1.50.1-noble /bin/bash

############################################################
#
# これ以降はコンテナ内での操作
#

# edge をインストール
npx playwright install msedge

# プロジェクト作成
npm init playwright@latest

# テスト実行
npx playwright test
```

## プロジェクト作成とテスト実行を一気に実行

edgeをインストールしてプロジェクト作成とテスト実行を一気に実行

```
docker run -it --rm \
    -v $(pwd):/my-playwright-work \
    -w /my-playwright-work --ipc=host \
    mcr.microsoft.com/playwright:v1.50.1-noble \
    bash -c "npx playwright install msedge && npm init playwright@latest && npx playwright test"
```


## Edge をターゲットにする

edge をインストール
```
npx playwright install msedge
```

playwright.config.ts に edge を追加
```
cat playwright.config.ts
:
/* Test against branded browsers. */
    {
      name: 'Microsoft Edge',
      use: { ...devices['Desktop Edge'], channel: 'msedge' },
    },
:
```

## テスト結果としてスクリーンショットを保存する
```