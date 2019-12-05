class CreateVerses < ActiveRecord::Migration[6.0]
  def change
    create_table :verses do |t|
      t.string :version
      t.references :testament, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :chapter
      t.integer :verse
      t.text :text

      t.timestamps
    end
    
  end
end
