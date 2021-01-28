## Business-Assist

![26f7bfcabe6484bc83f8ebf58f8d0cfd](https://user-images.githubusercontent.com/72916511/101851872-c112b680-3b9f-11eb-9152-3277b6ef198c.gif)


## アプリケーション概要

現在蔓延している、新型コロナウイルスにより脚光を浴びた補助金や助成金の情報を検索・閲覧できるアプリケーションを作成しました。また補助金・助成金だけではなく、地公体と金融機関が支援する制度融資に関する情報も同様に検索・閲覧ができるようになっています。お気に入りの数が多い記事を上位に掲載することで、みなさんがどの補助金情報に関心があるのかを簡単に閲覧できるようにしました。


## App URL

https://business-assist.work/

- 一般ユーザー：ログイン画面にある「ゲストログイン(ユーザー用)」からログインできます。
- 管理者ユーザー：ログイン画面にある「ゲストログイン(管理者用)」からログインできます。
- 法人ユーザー：法人会員ログイン画面にある「ゲストログイン(法人会員用)」からログインできます。


## 制作背景

私は前職で銀行員として勤務していました。主に中小企業へお金を貸し出す融資業務を行っており、在籍時には現在も猛威を奮っている新型コロナウイルスが世界的に蔓延しました。その中で雇用調整助成金や民間金融機関による実質無利子の融資など様々な政府の政策が行われています。しかしどんな補助金があるのか、どんな制度があるのかがわからないという声が多く聞かれました。そのことがきっかけで本アプリケーションを制作しようと考えました。忙しい中小企業経営者でも簡単に自社にとってメリットのある情報を入手できるサービスがあればと思い、このテーマにしました。
また、新たにビジネスマッチング（自社ニーズ投稿機能）を導入しました。以前から地方には根強い、銀行からの紹介や対面営業による取引拡大を狙う戦略に加え、地方の中小BtoB企業でも新たな取引が実現できる場がないかと考え、実装しました。


## 機能一覧

#### ユーザー管理機能(devise, Active Hash)

 - ログイン・ログアウト機能
 - SNS認証(Facebook, Googleアカウント)
 - 法人会員・個人会員登録機能


#### 記事投稿機能(管理者のみ)

 - 画像投稿(Active Storage, S3)
 - 投稿編集・削除
 - 画像プレビュー機能


#### 記事閲覧機能

 - 新着記事閲覧
 - 人気記事一覧として、いいね数の多い記事が表示されるよう実装


#### 記事詳細閲覧機能

 - Google Mapを使用し現在地から目的地を検索できるよう実装
 - 管理者のみ編集・削除ボタン表示
 - 非同期いいね機能(ログインユーザーのみ可)

![0973890fcaff422a866fecd6127af73a](https://user-images.githubusercontent.com/72916511/101851810-a2142480-3b9f-11eb-8b90-7878761c4992.gif)


#### 記事検索機能(ransack)

 - キーワード検索
 - Active Hashによるselect検索
 - 検索結果一覧をページネーション機能を用いて表示(kaminari)
 
![8fb64f238ee3dcde752c4eb0ffb7aad4](https://user-images.githubusercontent.com/72916511/101851927-dab3fe00-3b9f-11eb-85c1-9929c8e93f48.gif)


#### マイページ機能

 - お気に入り登録した記事をマイページにて表示


#### お問い合わせ機能(Action Mailer)

 - ユーザーがお問い合わせを送信すると管理者はメールで受信


#### コメント機能(Action Cable)

 - ActionCableを使用した即時コメント機能


#### ビジネスマッチング（自社ニーズ投稿）機能

 - ログインしているユーザーはニーズに応じた（売り・買い）投稿を行うことができる。
 - 投稿者は投稿文の編集や削除ができる
 - ニーズに応じた検索ができる

## ER図

![image](https://user-images.githubusercontent.com/72916511/104277224-d2761800-54e9-11eb-8617-779c5cf07cce.png)


## インフラ構成図

![Untitled Diagram](https://user-images.githubusercontent.com/72916511/104987277-ac57f700-5a58-11eb-91c6-0709e49d9027.png)


## 環境・使用技術

#### フロントエンド
 - HTML/CSS/jQuery/Bootstrap/Fontawesome
#### バックエンド
 - Ruby'2.6.5'/Ruby on Rails'6.0.0'
#### テストコード
 - Rspec/Capybara
#### 開発環境
 - Docker/Docker-compose
#### 本番環境
 - AWS(EC2,Route53,S3)
 - アプリケーションサーバー(Unicorn)
 - Webサーバー(Nginx)
 - データベース(mariaDB)
 - 自動デプロイ(Capistrano3)


## 実装予定の機能
 - フォロー機能
 - CircleCIの導入
 - 通知機能


## 工夫した点
 - CircleCIを導入したことによりrubocopによるコード確認、Rspecを使用したテストを構築し、pull時に問題を検知することで、アプリの品質を担保できていると実感しています。また、自動デプロイが実行されることにより、本番環境へのデプロイし忘れを防ぐなと、人為的なミスを防ぐことができました。
 - 開発環境にdockerを導入したことで、スムーズにチーム開発ができるようにした点。
 - 実装手順やエラー対処をQiita記事に記録として残しておくことで、同じようなエラーや実装をする際にスムーズな開発ができるようにした点。
 - 他の補助金検索アプリケーションの差別化として、お気に入り機能を実装し、ユーザーマイページでお気に入りした記事を確認できるよう実装した点（気になっている記事を簡略化して見ることができるように意識）。
 - お気に入り機能に連動した、ランキング機能を実装することで、どの補助金が注目されているのかをわかりやすく可視化した点。


 ## 苦労した点
  - AWSへのデプロイ時に、こまめなデプロイを行っておらず、ある程度アプリケーションが出来上がった後、まとめてデプロイを行った結果、エラーが多発し、自分のみでの解決に至らなかったため、アプリを再度作成し直した点。→こまめな本番環境での動作確認の重要性を認識できました。
  