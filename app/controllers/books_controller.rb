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
            render status: 404, json: { status: 404, message: "id:#{params[:id]} Not Found" }
            return
        end

        render 'show', formats: :json, handlers: 'jbuilder'
    end

    # 本を登録する
    def create
        @book = Book.create_with_isbn(params[:isbn])
        if @book.nil?
            render status: 404, json: { status: 404, message: "isbn:#{params[:isbn]} Not Found" }
            return
        end

        render 'show', formats: :json, handlers: 'jbuilder'
    end

    # Slack から本を登録する
    def slack

        p params

        # 送られてきたISBNを使用して本の情報を取得する
        @book = Book.create_with_isbn(params[:text])
        if @book.nil?
            render status: 404, json: { status: 404, message: "isbn:#{params[:text]} Not Found" }
            return
        end

        url = URI.parse(params[:response_url])
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        headers = { "Content-Type" => "application/json" }

        slackResponse = {
            "response_type": "in_channel",
            "text": @book.to_json
        }

        response = http.post(url.path, slackResponse.to_json, headers)
        responseJson = response.read_body
       
        p response
        p responseJson
        p response.code

        if response.code != 200
            render status: 500, json: { status: 500, message: "Slack response failed" }
            return
        end

        render 'show', formats: :json, handlers: 'jbuilder'
    end

end


