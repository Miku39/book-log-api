class BooksController < ApplicationController
    protect_from_forgery

    # 本のリストを表示する
    def index
        @books = Book.all
        render 'index', formats: :json, handlers: 'jbuilder'
    end

    # 本の詳細を表示する
    def show
        @book = Book.find_by_id(params[:id])
        # 本がない場合
        if @book.nil?
            halt status: 404, json: { status: 404, message: "id:#{params[:id]} Not Found" }
        end

        render 'show', formats: :json, handlers: 'jbuilder'
    end

    # 本を登録する
    def create
        @book = Book.create_with_isbn(params[:isbn])

        render 'show', formats: :json, handlers: 'jbuilder'
    end

    # Slack から本を登録する
    def slack
        p "aaaa"
        @book = {
            id: "777",
            isbn: "isbn", 
            image_url: "",
            title: "タイトル",
            author: "著者"
        }
        render 'show', formats: :json, handlers: 'jbuilder'
    end

end


