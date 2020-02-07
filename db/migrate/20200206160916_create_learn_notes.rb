class CreateLearnNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :learn_notes do |t|
      t.integer :status,                     null: false
      t.integer :user_id,                    null: false
      t.integer :word_id,                    null: false

      t.timestamps
    end

    add_index :learn_notes, :status
    add_index :learn_notes, :user_id
    add_index :learn_notes, :word_id
  end
end
