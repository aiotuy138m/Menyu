# Menyu　 <img src="https://github.com/aiotuy138m/Menyu/assets/122207424/4dc120f4-9014-44c5-a7a5-e70d82316989" width="100" height="100" >

## サイト概要
### サイトテーマ
　お店に対してのレビューではなく、メニューに対してのレビューサイト

### テーマを選んだ理由
　ラーメン屋に行くと大体食券制でメニューは即決めないと後ろの客に迷惑がかかったりするので、食券前で悩むまえにメニューを決めておきたいですよね。
ただ、あらかじめ決めていたとしてもいざ食券を前すると期間限定があったりと目移りすることも多いです。
お店に対してのレビューサイトはよくみますしその中でこれがおいしいなどのレビューはみますが、メニューで検索することはできませんし、メニューについてのレビューも
投稿者次第なので必ずあるとも限りません。そこでメニューに対してのレビューサイトをテーマに選びました。
最初はすべての飲食店対象にしようかとも思いましたが、発端がラーメンのメニューについてなので、麺（Men）に絞りました。

### ターゲットユーザ
- 好きなラーメンのジャンルが狭く、好きなラーメンを選ぶのに苦労している人
- あらかじめメニューを知って、注文する内容を決めておきたい人
- 次回食べようと思っているラーメンをメモしておきたい人
- 美味しかったメニューを記録して見返したい人

### 主な利用シーン
- 自身が食べたメニューに対しての記録、見返しをしたい時
- 行きたいお店のラーメンのメニューを知りたい時
- 好きなラーメンのジャンルのメニューを知りたい時
- 人気のメニューを知りたい時

## 主な機能
- ゲストログイン機能
- 会員機能
- ユーザー・レビュー・ジャンル・店情報・通報情報　管理機能
- レビュー投稿機能
- 地図表示機能
- 非公開投稿機能
- 食べたいリスト（ブックマーク）
- いいね機能
- コメント機能
- 通報（報告）機能
- ジャンルと店での絞り機能
- ジャンルと店での検索機能

### イメージ画像

#### トップページ
<img width="1433" alt="スクリーンショット 2023-05-31 20 11 53" src="https://github.com/aiotuy138m/Menyu/assets/122207424/766cc0c8-f69d-4d86-bdbc-af5f1d2b2688">

#### マイページ
<img width="1230" alt="スクリーンショット 2023-05-31 20 15 48" src="https://github.com/aiotuy138m/Menyu/assets/122207424/dd29852c-9984-40c1-908c-b1d35fb01950">


## 設計書
- ER図: https://drive.google.com/file/d/1xLwRkQPFP6Vsbiel7aLqNjrNmUkEPsmG/view?usp=sharing
- テーブル定義書: https://docs.google.com/spreadsheets/d/1k_ecqGaVn0pGaQPHsIItygX_U4OYDOF-JGHHlVtRyxE/edit?usp=sharing
- 実装機能リスト: https://docs.google.com/spreadsheets/d/1TiYwpm9_Yw4ipzxSmeHwZfcB7a7sslbdahmEhNVXS7g/edit?usp=sharing
- テスト仕様書: https://docs.google.com/spreadsheets/d/1EGOKVGawufm87fTbCnQ2G9u8kyqn7K85YhZkTsGsyfY/edit#gid=2096043569

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用gem
- bootsnap
- devise
- dotenv-rails
- google_places
- gmaps4rails
- geocoder
- kaminari

## 外部API
- Maps JavaScript API
- Geocoding API

## 本番環境
- EC2（Amazon Linux 2）
- RDS
- Route53
