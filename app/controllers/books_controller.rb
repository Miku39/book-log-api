class BooksController < ApplicationController
    # 本のリストを表示する
    def index
        @books = [
            {
                id: 1,
                isbn: '1617292397',
                image_url: 'https://books.google.com/books/content?id=UXNaAQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
                title: 'Soft Skills',
                author: 'John Z. Sonmez',
                date: '2019-12-17'
            },
            {
                id: 2,
                isbn: '1617292397',
                image_url: 'https://books.google.com/books/content?id=UXNaAQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
                title: 'Soft Skills',
                author: 'John Z. Sonmez',
                date: '2019-12-17'
            }
        ]
        render 'index', formats: :json, handlers: 'jbuilder'
    end

    # 本の詳細を表示する
    def show
        @book = {
                id: params[:id],
                isbn: '1617292397',
                image_url: 'https://books.google.com/books/content?id=UXNaAQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
                title: 'Soft Skills',
                author: 'John Z. Sonmez',
                date: '2019-12-17',
                note: '面白くてタメになった'
            }
        render 'show', formats: :json, handlers: 'jbuilder'
    end
end


