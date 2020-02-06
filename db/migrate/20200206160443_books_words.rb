class BooksWords < ActiveRecord::Migration[5.1]
  def change
    create_table :books_words, id: false do |t|
      t.belongs_to :books, index: true
      t.belongs_to :words, index: true
    end
  end
end
