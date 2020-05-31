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

ActiveRecord::Schema.define(version: 2020_05_31_133117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "decoy_templates", force: :cascade do |t|
    t.text "name"
    t.text "template"
    t.text "description"
    t.text "service"
    t.text "os"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "decoys", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "ip"
    t.integer "config"
    t.bigint "network_id", null: false
    t.bigint "decoy_template_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["config"], name: "index_decoys_on_config", unique: true
    t.index ["decoy_template_id"], name: "index_decoys_on_decoy_template_id"
    t.index ["network_id"], name: "index_decoys_on_network_id"
  end

  create_table "networks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.text "vlan"
    t.text "subnet"
    t.text "gateway"
    t.integer "asset"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "macvlan_name"
    t.index ["user_id"], name: "index_networks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "decoys", "decoy_templates"
  add_foreign_key "decoys", "networks"
end
