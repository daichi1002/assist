## Business-Assist

![26f7bfcabe6484bc83f8ebf58f8d0cfd](https://user-images.githubusercontent.com/72916511/101851872-c112b680-3b9f-11eb-9152-3277b6ef198c.gif)


## アプリケーション概要

現在蔓延している、新型コロナウイルスにより脚光を浴びた補助金や助成金の情報を検索・閲覧できるアプリケーションを作成しました。また補助金・助成金だけではなく、地公体と金融機関が支援する制度融資に関する情報も同様に検索・閲覧ができるようになっています。お気に入りの数が多い記事を上位に掲載することで、みなさんがどの補助金情報に関心があるのかを簡単に閲覧できるようにしました。


## App URL

https://business-assist.work/

・ヘッダーにある簡易ログインからゲストユーザーとしてログインできます

・管理者用ログイン 【email】:admin@example.com【password】:daichi1002


## 制作背景

私は前職で銀行員として勤務していました。主に中小企業へお金を貸し出す融資業務を行っており、在籍時には現在も猛威を奮っている新型コロナウイルスが世界的に蔓延しました。GotoトラベルやGotoEatなどでフォーカスされている、観光業・飲食業はもちろんですが、その他の様々な業種も影響を受けていました。その中で雇用調整助成金や民間金融機関による実質無利子の融資など様々な政府の政策が行われています。しかしどんな補助金があるのか、どんな制度があるのかがわからないという声が多く聞かれました。そのことがきっかけで本アプリケーションを制作しようと考えました。忙しい中小企業経営者でも簡単に自社にとってメリットのある情報を入手できるサービスがあればと思い、このテーマにしました。


## 機能一覧

#### ユーザー管理機能(devise, Active Hash)

 - ログイン・ログアウト機能
 - SNS認証(Facebook, Googleアカウント)


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

![8fb64f238ee3dcde752c4eb0ffb7aad4](https://user-images.githubusercontent.com/72916511/101851927-dab3fe00-3b9f-11eb-85c1-9929c8e93f48.gif)


#### マイページ機能

 - お気に入り登録した記事をマイページにて表示


#### お問い合わせ機能(Action Mailer)

 - ユーザーがお問い合わせを送信すると管理者はメールで受信


#### コメント機能


## ER図

![assist](https://user-images.githubusercontent.com/72916511/101444942-f337d480-3963-11eb-821e-5a61f4393ffc.png)


## インフラ構成図

![Untitled Diagram (3)](https://user-images.githubusercontent.com/72916511/101437770-46a22680-3954-11eb-98e7-24b284ce45c6.png)


## 環境・使用技術

#### フロントエンド
 - HTML/CSS/jQuery/Bootstrap/Fontawesome
#### バックエンド
 - Ruby'2.6.5'/Ruby on Rails'6.0.0'
#### テストコード
 - Rspec/Capybara
#### 本番環境
 - AWS(EC2,Route53,S3)
 - アプリケーションサーバー(Unicorn)
 - Webサーバー(Nginx)
 - データベース(mariaDB)
 - 自動デプロイ(Capistrano3)

## 実装予定の機能

 - 通知機能