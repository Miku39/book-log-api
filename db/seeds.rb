# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.create!(
    isbn: '1617292397',
    image_url: 'https://books.google.com/books/content?id=UXNaAQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
    title: 'Soft Skills',
    author: 'John Z. Sonmez',
    date: '2019-12-17',
    note: '面白くてタメになった'
)