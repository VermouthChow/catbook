json.key_format! camelize: :lower

json.array! @words do |word|
  json.id word.id
  json.name_a word.name_a
  json.name_b word.name_b
  json.created_at word.created_at.to_i
  json.updated_at word.updated_at.to_i
  json.learn_status user_learn_words(word.learn_notes)&.status
end