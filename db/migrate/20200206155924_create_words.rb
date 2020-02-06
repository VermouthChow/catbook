class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :name_a
      t.string :name_b
      t.string :sounds_a
      t.string :sounds_b
      t.text :explanation
      t.text :example

      t.timestamps
    end

    add_index :words, :name_a
    add_index :words, :name_b
  end
end
