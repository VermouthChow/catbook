class CreateNotebooks < ActiveRecord::Migration[5.1]
  def change
    create_table :notebooks do |t|
      t.integer :status
      t.integer :user_id
      t.integer :word_id

      t.timestamps
    end

    add_index :notebooks, :status
    add_index :notebooks, :user_id
    add_index :notebooks, :word_id
  end
end
