json.array! @books do |book|
    json.partial! 'book', book: book
end