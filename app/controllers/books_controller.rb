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
        @book = Book.create_with_isbn(params[:text])
        # 送られてきたISBNを使用して本の情報を取得する
        # todo 500エラー修正
        url = URI.parse(params[:response_url])
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        params = @book.to_json
        headers = { "Content-Type" => "application/json" }

        response = http.post(uri.path, params.to_json, headers)

        p 'response start'
        p response
        p 'response end'

        responseJson = response.read_body
        hash = JSON.parse(responseJson)
       
        p `hash start`
        p hash
        p `hash end`

        render 'show', formats: :json, handlers: 'jbuilder'
    end

end


