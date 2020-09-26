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
        
        # TODO: modelに記載する
        # 送られてきたISBNを使用して本の情報を取得する
        url = URI.parse("https://www.googleapis.com/books/v1/volumes?q=isbn:#{params[:isbn]}")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)

        response = http.request(request)
        responseJson = response.read_body
        hash = JSON.parse(responseJson)

        # DBに登録
        volumeInfo = hash["items"][0]["volumeInfo"]
        book = Book.create(
            isbn: params[:isbn], 
            image_url: volumeInfo["imageLinks"]["thumbnail"],
            title: volumeInfo["title"],
            author: volumeInfo["authors"][0]
        )

        # TODO: showと同じjsonを返すようにする
        render status: 200, json: { 
            message: "title: #{volumeInfo["title"]}, author: #{volumeInfo["authors"][0]}"
        }
    end
end


