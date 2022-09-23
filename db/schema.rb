# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_23_112809) do
  create_table "inboxes", force: :cascade do |t|
    t.integer "messages_id", null: false
    t.integer "rules_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["messages_id"], name: "index_inboxes_on_messages_id"
    t.index ["rules_id"], name: "index_inboxes_on_rules_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "sender_address"
    t.string "recipient_address"
    t.string "subject"
    t.datetime "send_at", precision: nil
    t.text "header_fields"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipients", force: :cascade do |t|
    t.string "name"
    t.string "email_address"
    t.string "username"
    t.string "password_digest"
    t.integer "editing_performance_per_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "inbox_id", null: false
    t.index ["inbox_id"], name: "index_recipients_on_inbox_id"
  end

  create_table "rules", force: :cascade do |t|
    t.string "field_to_search"
    t.string "field_matcher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "values", force: :cascade do |t|
    t.string "sender_address"
    t.string "recipient_address"
    t.datetime "send_at", precision: nil
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inboxes", "messages", column: "messages_id"
  add_foreign_key "inboxes", "rules", column: "rules_id"
  add_foreign_key "recipients", "inboxes"
end
