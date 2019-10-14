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

ActiveRecord::Schema.define(version: 2019_10_10_125022) do

  create_table "session_manager_sessions", force: :cascade do |t|
    t.string "email", null: false
    t.integer "user_id", null: false
    t.string "token", null: false
    t.string "user_agent", null: false
    t.string "ip_address", null: false
    t.datetime "login_time", null: false
    t.datetime "logout_time"
    t.datetime "last_seen", null: false
    t.boolean "archived", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_session_manager_sessions_on_token"
  end

end
