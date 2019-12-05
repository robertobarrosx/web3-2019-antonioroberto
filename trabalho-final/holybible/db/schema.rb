# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_05_002709) do

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "abbrev"
    t.bigint "testament_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["testament_id"], name: "index_books_on_testament_id"
  end

  create_table "churches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_churches_on_user_id"
  end

  create_table "ministries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "picture"
    t.text "text"
    t.date "date"
    t.bigint "user_id", null: false
    t.bigint "church_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["church_id"], name: "index_ministries_on_church_id"
    t.index ["user_id"], name: "index_ministries_on_user_id"
  end

  create_table "testaments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "kind", default: "normal", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true, length: 191
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, length: 191
  end

  create_table "verses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "version"
    t.bigint "testament_id", null: false
    t.bigint "book_id", null: false
    t.integer "chapter"
    t.integer "verse"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_verses_on_book_id"
    t.index ["testament_id"], name: "index_verses_on_testament_id"
  end

  add_foreign_key "books", "testaments"
  add_foreign_key "churches", "users"
  add_foreign_key "ministries", "churches"
  add_foreign_key "ministries", "users"
  add_foreign_key "verses", "books"
  add_foreign_key "verses", "testaments"
end
