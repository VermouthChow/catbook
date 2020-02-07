json.key_format! camelize: :lower

json.word do
  json.id @word.id
  json.name_a @word.name_a
  json.name_b @word.name_b
  json.sounds_a @word.sounds_a
  json.sounds_b @word.sounds_b
  json.explanation @word.explanation
  json.example @word.example
  json.learn_status user_learn_words(@word.learn_notes)&.status
  json.created_at @word.created_at.to_i
  json.updated_at @word.updated_at.to_i
end