class Book < ApplicationRecord
    def self.create_with_isbn(isbn)
        # 送られてきたISBNを使用して本の情報を取得する
        url = URI.parse("https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)

        response = http.request(request)
        responseJson = response.read_body
        hash = JSON.parse(responseJson)

        # DBに登録
        volumeInfo = hash["items"][0]["volumeInfo"]
        book = Book.create(
            isbn: isbn, 
            image_url: volumeInfo["imageLinks"]["thumbnail"],
            title: volumeInfo["title"],
            author: volumeInfo["authors"][0]
        )
        return book
    end
end
