class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :abbrev
      t.references :testament, null: false, foreign_key: true

      t.timestamps
    end
  end
end
