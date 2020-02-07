json.key_format! camelize: :lower

json.array! @books do |book|
  json.id book.id
  json.name book.name
  json.created_at book.created_at.to_i
  json.updated_at book.updated_at.to_i
  json.words_count book.words.size
end