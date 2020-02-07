class CreateBooksWords < ActiveRecord::Migration[5.1]
  def change
    create_table :books_words, id: false do |t|
      t.belongs_to :book, index: true
      t.belongs_to :word, index: true
    end
  end
end
