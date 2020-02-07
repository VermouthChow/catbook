class CreateNotebooks < ActiveRecord::Migration[5.1]
  def change
    create_table :notebooks do |t|
      t.integer :status,                     null: false
      t.integer :user_id,                    null: false
      t.integer :word_id,                    null: false

      t.timestamps
    end

    add_index :notebooks, :status
    add_index :notebooks, :user_id
    add_index :notebooks, :word_id
  end
end
