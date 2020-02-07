class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :name_a,                    null: false
      t.string :name_b,                    null: false
      t.string :sounds_a,                  null: false
      t.string :sounds_b,                  null: false
      t.text :explanation,                 null: false
      t.text :example

      t.timestamps
    end

    add_index :words, :name_a,             using: :gin
    add_index :words, :name_b,             using: :gin
  end
end
