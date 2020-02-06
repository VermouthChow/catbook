# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200206160916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "btree_gin"
  enable_extension "btree_gist"

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books_words", id: false, force: :cascade do |t|
    t.bigint "books_id"
    t.bigint "words_id"
    t.index ["books_id"], name: "index_books_words_on_books_id"
    t.index ["words_id"], name: "index_books_words_on_words_id"
  end

  create_table "learn_notes", force: :cascade do |t|
    t.integer "status"
    t.integer "user_id"
    t.integer "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status"], name: "index_learn_notes_on_status"
    t.index ["user_id"], name: "index_learn_notes_on_user_id"
    t.index ["word_id"], name: "index_learn_notes_on_word_id"
  end

  create_table "notebooks", force: :cascade do |t|
    t.integer "status"
    t.integer "user_id"
    t.integer "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status"], name: "index_notebooks_on_status"
    t.index ["user_id"], name: "index_notebooks_on_user_id"
    t.index ["word_id"], name: "index_notebooks_on_word_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "name_a"
    t.string "name_b"
    t.string "sounds_a"
    t.string "sounds_b"
    t.text "explanation"
    t.text "example"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name_a"], name: "index_words_on_name_a"
    t.index ["name_b"], name: "index_words_on_name_b"
  end

end
