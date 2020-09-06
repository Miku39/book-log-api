class BooksController < ApplicationController
    def index
        render 'index', formats: :json, handlers: 'jbuilder'
    end
end
