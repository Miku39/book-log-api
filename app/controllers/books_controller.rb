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
        
        # 送られてきたISBNを使用して本の情報を取得する
        url = URI.parse("https://www.googleapis.com/books/v1/volumes?q=isbn:#{params[:isbn]}")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)

        response = http.request(request)
        responseJson = response.read_body

        # TODO DB登録, レスポンス作成

        # responseからデータを抽出する
        # volumeInfo = responseJson.items[0].volumeInfo
        # p volumeInfo.imageLinks.thumbnail
        # p volumeInfo.title
        # p volumeInfo.authors[0]
        
        # TODO: modelに移動？
        # book = Book.create(
        #     isbn: params[:isbn], 
        #     image_url: responseJson.items[0].,
        #     title: "",
        #     author: "",
        #     date: "",
        #     note: ""
        # )

        render status: 200, json: { status: 200, message: "create method" }
    end
end


