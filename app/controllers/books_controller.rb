class BooksController < ApplicationController
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
            render status: 404, json: { status: 404, message: "id:#{params[:id]} Not Found" }
            return
        end

        render 'show', formats: :json, handlers: 'jbuilder'
    end
end


