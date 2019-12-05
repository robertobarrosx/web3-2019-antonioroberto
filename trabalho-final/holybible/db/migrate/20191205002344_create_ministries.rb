class CreateMinistries < ActiveRecord::Migration[6.0]
  def change
    create_table :ministries do |t|
      t.string :title
      t.string :description
      t.string :picture
      t.text :text
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :church, null: false, foreign_key: true

      t.timestamps
    end
  end
end
