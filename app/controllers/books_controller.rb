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

        render 'show', formats: :json, handlers: 'jbuilder'
    end

    # Slack から本を登録する
    def slack
        # TODO print delete
        p "slack method!!!" 
        p params

        # 送られてきたISBNを使用して本の情報を取得する
        @book = Book.create_with_isbn(params[:text])
        # TODO isbnがない場合のエラー処理
        if @book.zero?
            p "blankaaaaaaaa"
            render status: 404, json: { status: 404, message: "isbn:#{params[:text]} Not Found" }
            return
        end

        p "print book start"
        p @book
        p "print book end"
        
        url = URI.parse(params[:response_url])
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        headers = { "Content-Type" => "application/json" }

        slackResponse = {
            "response_type": "in_channel",
            "text": @book.to_json
        }

        p 'print slackResponse start'
        p slackResponse.to_json
        p url.path
        p headers
        p 'print slackResponse end'

        response = http.post(url.path, slackResponse.to_json, headers)

        p 'response start'
        p response
        p 'response end'

        responseJson = response.read_body
       
        p 'hash start'
        p responseJson
        p 'hash end'
        if response.code != 200
            p "Slack投稿できなかったエラ〜メッセージ"
            # halt status: 400, json: { status: 400, message: "Slack response failed" }
        end

        render 'show', formats: :json, handlers: 'jbuilder'
    end

end


