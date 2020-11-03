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
        # TODO delete
        p "slack method!!!"
        @book = Book.create_with_isbn(params[:text])
        # 送られてきたISBNを使用して本の情報を取得する
        url = URI.parse(params[:response_url])
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        headers = { "Content-Type" => "application/json" }

        slackResponse = {
            "response_type": "in_channel",
            "text": "It's 80 degrees right now."
        }

        p 'print slackResponse start'
        p slackResponse
        p 'print slackResponse end'

        # TODO slack body 調べる
        response = http.post(url.path, slackResponse.to_json, headers)

        p 'response start'
        p response
        p 'response end'

        responseJson = response.read_body
       
        p 'hash start'
        p JSON.parse(responseJson)
        p 'hash end'

        render 'show', formats: :json, handlers: 'jbuilder'
    end

end


