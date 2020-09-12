# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Book.create!(
    [
      {
        isbn: '1617292397',
        image_url: 'https://books.google.com/books/content?id=UXNaAQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
        title: 'Soft Skills',
        author: 'John Z. Sonmez',
        date: '2019-12-17',
        note: 'タメになった'
      },
      {
        isbn: '4801400604',
        image_url: 'https://books.google.com/books/content?id=uKsyvwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
        title: 'お金のこと何もわからないままフリーランスになっちゃいましたが税金で損しない方法を教えてください!',
        author: '大河内薫 / 若林杏樹',
        date: '2020-08-02',
        note: 'スラスラ読めた'
      }
    ]
  )