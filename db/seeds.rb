# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者のメールアドレスの初期設定
Admin.create(
  email: "admin@admin",
  password: "adminadmin"
  )
# 会員側のメールアドレス
Customer.create(
  [
    {
      email: "oniku@oniku",
      password: "onikuoniku",
      first_name: "太郎",
      last_name: "鶏肉",
      first_name_kana: "タロウ",
      last_name_kana: "トリニク",
      address: "お肉",
      postcode: "1234567",
      telephone_number: "0123456789",
      is_deleted: "false",
    },
    {
      email: "gyuoniku@gyuoniku",
      password: "onikuoniku",
      first_name: "二郎",
      last_name: "牛肉",
      first_name_kana: "ジロウ",
      last_name_kana: "ギュウニク",
      address: "牛肉",
      postcode: "0123456",
      telephone_number: "1234567890",
      is_deleted: "false",
    }
  ]
)




# ジャンル一覧
  Genre.create(name: "ケーキ")
  Genre.create(name: "プリン")
  Genre.create(name: "焼き菓子")
  Genre.create(name: "キャンディ")

# 商品情報一覧
  Item.create(
  [
    {
      name: '苺のショートケーキ',
      introduction: '一番人気です☆',
      price: 700,
      genre_id: 1,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/shortcake.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: 'チョコレートケーキ',
      introduction: '甘さ控えめとなってます。',
      price: 700,
      genre_id: 1,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/chococake.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: 'おにくケーキ',
      introduction: 'お誕生日会に是非！',
      price: 30000,
      genre_id: 1,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/meatcake.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: 'プリンアラモード',
      introduction: '自家製プリンに季節のフルーツを乗せて。',
      price: 900,
      genre_id: 2,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/alamode.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: 'バームクーヘン',
      introduction: '一層一層丁寧に焼き上げてます。',
      price: 1200,
      genre_id: 3,
      is_active: false,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/baumkuchen.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: 'クッキー詰め合わせ',
      introduction: 'お茶会のお供にオススメです。',
      price: 2000,
      genre_id: 3,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/cookiebox.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: '自家製プリン',
      introduction: '濃厚な卵とほろ苦カラメルソースが相性抜群です。',
      price: 300,
      genre_id: 2,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/pudding.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: 'フルーツタルト',
      introduction: 'サクサクのタルト生地です。',
      price: 600,
      genre_id: 1,
      is_active: false,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/tart.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: 'マドレーヌ',
      introduction: 'さわやかなレモンの香りが広がるマドレーヌです。',
      price: 350,
      genre_id: 3,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/madeleine.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: '苺のロールケーキ',
      introduction: '生クリームがぎっしり詰まってます。',
      price: 600,
      genre_id: 1,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/rollcake.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: 'フィナンシェ',
      introduction: 'バターをたっぷり使い風味豊かに仕上げました。',
      price: 350,
      genre_id: 3,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/financier.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: '飴玉',
      introduction: '20個入り、瓶詰めタイプ。',
      price: 800,
      genre_id: 4,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/candy.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: 'フロマージュ',
      introduction: '驚くほどのふわとろ食感。',
      price: 650,
      genre_id: 1,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/fromage.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: 'チョコチップクッキー',
      introduction: '1袋5枚入り。',
      price: 400,
      genre_id: 3,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/chocochips.jpeg"), filename: 'default-image.jpeg')
    },
    {
      name: 'モンブラン',
      introduction: '秋季限定品。',
      price: 800,
      genre_id: 1,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/montblanc.jpeg"), filename: 'default-image.jpeg')
    }
  ]
)
