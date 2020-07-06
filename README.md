![Mathmate](https://user-images.githubusercontent.com/63136727/86557158-51fdba00-bf90-11ea-860d-927b06825264.JPG)

# Mathmate: 数学専用質問サービス
---
Mathmateは数学に特化した質問サービスです。従来の質問サービスとは違い、数式がキレイに表示できるライブラリ「LaTex」を導入してあります。

## Mathmateの構成
---

### 構成
--- 
MathmateはAWSに、次のような構成でデプロイしています。


#### インフラ環境
- EC2/ RDS/ S3/ AMI/ ELB/ MySQL/ Nginx/ Unicorn
![インフラ構成](https://user-images.githubusercontent.com/63136727/86557166-56c26e00-bf90-11ea-9336-08fac147e50a.PNG)

#### 言語/フレームワーク
- Ruby/ Ruby on Rails
- Scss/ Bootstrap
- jQuery

#### 開発環境
- Docker
- docker-compose

### 機能一覧
---
- 記事投稿
    - 投稿プレビュー機能
    - LaTax挿入機能
    - 画像挿入機能(carrierwave - S3)
    - 画像プレビュー機能
    - 必須項目のバリデーション機能

- 記事閲覧
    - 横スクロール機能（scroll animation）
    - 画像拡大機能（Lightbox2）
    - LaTax表示機能（MathJax）
    - いいね機能
    - 保存機能
    - コメント機能
    - コメントバック機能

- 記事検索機能
- ページネーション機能(kaminari)

- マイページ
    - プロフィール画像挿入機能
    - いいねした記事一覧表示機能
    - 保存した記事一覧表示機能
    - 投稿した記事一覧表示機能
    - コメントした記事一覧表示機能

- 認証（ログイン）機能(devise)

- テスト
    - RSpec
    - Capybara
    - FactoryBot

- 品質管理
   - Rubocop


