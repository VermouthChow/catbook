class CreateLearnNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :learn_notes do |t|
      t.integer :status
      t.integer :user_id
      t.integer :word_id

      t.timestamps
    end

    add_index :learn_notes, :status
    add_index :learn_notes, :user_id
    add_index :learn_notes, :word_id
  end
end
