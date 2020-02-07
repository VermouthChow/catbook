json.key_format! camelize: :lower

json.learn_notes do
  json.id @learned.id
  json.status @learned.status
  json.created_at @learned.created_at.to_i
  json.updated_at @learned.updated_at.to_i
end

json.word do
  json.id @updated_word.id
  json.name_a @updated_word.name_a
  json.name_b @updated_word.name_b
  json.sounds_a @updated_word.sounds_a
  json.sounds_b @updated_word.sounds_b
  json.explanation @updated_word.explanation
  json.example @updated_word.example
  json.created_at @updated_word.created_at.to_i
  json.updated_at @updated_word.updated_at.to_i
end