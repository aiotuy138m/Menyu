# Menyu

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

## 設計書
- ER図: https://drive.google.com/file/d/1Z0__T6A3wLPwbE2l34Kb1yRJl7Mic9Wc/view?usp=sharing
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
