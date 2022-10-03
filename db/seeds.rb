# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'hanahiroba@test.com',
   password: 'hanahiroba',
  )

Customer.create!(
    email: 'tsumami@test.com',
    password: 'tsumami',
    last_name: 'つまみ',
    first_name: '細工',
    last_name_kana: 'ツマミ',
    first_name_kana: 'ザイク',
    postal_code: '0000000',
    address: 'つまみ県細工市',
    telephone_number: '00000000000',
    is_deleted: 'false'
)

Genre.create!(
   [
      {name: '髪飾り'},
      {name: 'アクセサリー'},
      {name: 'インテリア'}
   ]
)


design1 = Design.create!(
   genre_id: '2', design_name: 'オーダーメイドイヤリング',
   design_introduction: '好きなカラーを選んでオリジナルのイヤリングが作れます！', design_price: '25000', design_type: 'false'
)
design1.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_5911.png")), filename: "IMG_5911.png")
design1.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_5913.PNG")), filename: "IMG_5913.PNG")
design1.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_5914.PNG")), filename: "IMG_5914.PNG")


design2 = Design.create!(
   genre_id: '1', design_name: '段菊の髪飾り',
   design_introduction: '数種類のつまみ細工を組み合わせたスタンダードな髪飾りです。', design_price: '15000', design_type: 'true'
)
design2.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_9865.JPG")), filename: "IMG_9865.JPG")
design2.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_9866.JPG")), filename: "IMG_9866.JPG")
design2.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_9869.JPG")), filename: "IMG_9869.JPG")
design2.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_9872.JPG")), filename: "IMG_9872.JPG")
design2.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_9873.JPG")), filename: "IMG_9873.JPG")
design2.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_9875.JPG")), filename: "IMG_9875.JPG")

design3 = Design.create!(
   genre_id: '3', design_name: '季節のお花図鑑',
   design_introduction: '季節ごとのお花をつまみ細工で作りました。', design_price: '18000', design_type: 'true'
)
design3.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_9516.JPG")), filename: "IMG_9516.JPG")
design3.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_9524.JPG")), filename: "IMG_9524.JPG")
design3.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_9527.JPG")), filename: "IMG_9527.JPG")
design3.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_9508.JPG")), filename: "IMG_9508.JPG")
design3.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_9505.JPG")), filename: "IMG_9505.JPG")
design3.images.attach(io: File.open(Rails.root.join("db/fixtures/IMG_9512.JPG")), filename: "IMG_9512.JPG")



Item.create!(
   design_id: '1', item_introduction: 'a', item_price: '25000', stock: '10', is_active: 'true', clone: 'false'
)


Item.create!(
   design_id: '2', item_introduction: 'ピンク', item_price: '15000', stock: '5', is_active: 'true', clone: 'false',
   image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/IMG_9865.JPG"), filename: "IMG_9865.JPG")
)
Item.create!(
   design_id: '2', item_introduction: 'オレンジ', item_price: '15000', stock: '5', is_active: 'true', clone: 'false',
   image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/IMG_9872.JPG"), filename: "IMG_9872.JPG")
)


Item.create!(
   design_id: '3', item_introduction: '春', item_price: '18000', stock: '5', is_active: 'true', clone: 'false',
   image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/IMG_9516.JPG"), filename: "IMG_9516.JPG")
)
Item.create!(
   design_id: '3', item_introduction: '夏', item_price: '18000', stock: '5', is_active: 'true', clone: 'false',
   image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/IMG_9508.JPG"), filename: "IMG_9508.JPG")
)
Item.create!(
   design_id: '3', item_introduction: '秋', item_price: '18000', stock: '5', is_active: 'true', clone: 'false',
   image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/IMG_9505.JPG"), filename: "IMG_9505.JPG")
)
Item.create!(
   design_id: '3', item_introduction: '冬', item_price: '18000', stock: '5', is_active: 'true', clone: 'false',
   image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/IMG_9512.JPG"), filename: "IMG_9512.JPG")
)

Order.create!(
   customer_id: '1', postage: '800', total_price: '17300', payment_method: '0',
   postal_code: '0000000', address: 'つまみ県細工市', name: 'つまみ細工'
)

OrderDetail.create!(
   item_id: '2', order_id: '1', price: '16500', amount: '1'
)

Review.create!(
   customer_id: '1', design_id: '1', rate: '5.0', body: 'とても可愛いです！',
   image:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/IMG_5913.PNG"), filename: "IMG_5913.PNG")
)
