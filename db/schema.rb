# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_07_020116) do

  create_table "adms", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_adms_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "texto"
    t.integer "user_id"
    t.integer "sala_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sala_id"], name: "index_messages_on_sala_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "participantes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sala_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sala_id"], name: "index_participantes_on_sala_id"
    t.index ["user_id"], name: "index_participantes_on_user_id"
  end

  create_table "salas", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.boolean "ativa", default: true
    t.integer "adm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adm_id"], name: "index_salas_on_adm_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", null: false
    t.integer "age", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
