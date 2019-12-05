class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :kind, null: false, default: "normal"

      #aqui
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      #aqui
    end
    add_index :users, :email,                unique: true ,length: 191
    add_index :users, :reset_password_token, unique: true ,length: 191 
  end
end
