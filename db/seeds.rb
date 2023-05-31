# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'a@a',
  password: 'testtest'
)

Customer.create!(
  [
    {
      email: '1@1',
      password: '111111',
      nickname: 'むつき太郎',
      is_deleted: 'false'
    },
    {
      email: '2@2',
      password: '222222',
      nickname: 'きさらぎ花子',
      is_deleted: 'false'
    },
    {
      email: '3@3',
      password: '333333',
      nickname: 'やよい次郎',
      is_deleted: 'false'
    },
  ]
)

Genre.create!(
  [
    {
      name: '醤油'
    },
    {
      name: '塩'
    },
    {
      name: '味噌'
    },
    {
      name: '豚骨'
    },
    {
      name: '牛骨'
    },
    {
      name: '白湯'
    },
    {
      name: '鶏白湯'
    },
    {
      name: '家系'
    },
    {
      name: '二郎系'
    },
    {
      name: '貝'
    },
    {
      name: '魚'
    },
    {
      name: '煮干し'
    },
    {
      name: 'ちゃんぽん'
    },
    {
      name: '辛い'
    },
    {
      name: 'あっさり'
    },
    {
      name: 'こってり'
    },
    {
      name: '濃厚'
    },
    {
      name: '淡白'
    },
    {
      name: 'にんにく'
    },
    {
      name: 'チャーシュー'
    },
    {
      name: '鶏チャーシュー'
    },
    {
      name: '牛チャーシュー'
    },
    {
      name: 'レアチャーシュー'
    },
    {
      name: 'トッピング有'
    },
    {
      name: 'つけ麺'
    },
    {
      name: 'まぜそば'
    },
    {
      name: 'うどん'
    },
    {
      name: 'パスタ'
    },
    {
      name: 'そば'
    },
    {
      name: '飯物'
    },
    {
      name: 'サイドメニュー'
    }
  ]
)