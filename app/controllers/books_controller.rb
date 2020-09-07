class BooksController < ApplicationController
    def index
        @books = [
            {
                isbn: '1617292397',
                image_url: 'https://books.google.com/books/content?id=UXNaAQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
                title: 'Soft Skills',
                author: 'John Z. Sonmez',
                date: '2019-12-17'
            },
            {
                isbn: '1617292397',
                image_url: 'https://books.google.com/books/content?id=UXNaAQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
                title: 'Soft Skills',
                author: 'John Z. Sonmez',
                date: '2019-12-17'
            }
        ]
        render 'index', formats: :json, handlers: 'jbuilder'
    end
end


