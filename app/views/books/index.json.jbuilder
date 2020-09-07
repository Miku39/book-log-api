json.array! @books do |book|
    json.isbn book[:isbn]
    json.image_url book[:image_url]
    json.title book[:title]
    json.author book[:author]
    json.date book[:date]
end
  
