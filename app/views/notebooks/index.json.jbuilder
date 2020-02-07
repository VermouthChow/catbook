json.key_format! camelize: :lower

json.array! @note_words do |note|
  json.id note.id
  json.status note.status
  json.user_id note.user_id
  json.created_at note.created_at.to_i
  json.updated_at note.updated_at.to_i

  json.name_a note.word.updated_at.to_i
  json.name_b note.word.updated_at.to_i
end