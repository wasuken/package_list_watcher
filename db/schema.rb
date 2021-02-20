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

ActiveRecord::Schema.define(version: 2021_02_20_143037) do

  create_table "captures", force: :cascade do |t|
    t.integer "server_id", null: false
    t.integer "package_version_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["package_version_id"], name: "index_captures_on_package_version_id"
    t.index ["server_id"], name: "index_captures_on_server_id"
  end

  create_table "package_versions", force: :cascade do |t|
    t.integer "package_id", null: false
    t.string "version"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["package_id"], name: "index_package_versions_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "servers", force: :cascade do |t|
    t.string "name"
    t.string "pac_type"
    t.string "arch"
    t.string "other_info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"package_id\", \"version\"", name: "index_servers_on_package_id_and_version", unique: true
    t.index "\"server_id\", \"package_version_id\"", name: "index_servers_on_server_id_and_package_version_id", unique: true
    t.index ["name", "pac_type"], name: "index_servers_on_name_and_pac_type", unique: true
    t.index ["name"], name: "index_servers_on_name", unique: true
  end

  add_foreign_key "captures", "package_versions"
  add_foreign_key "captures", "servers"
  add_foreign_key "package_versions", "packages"
end
