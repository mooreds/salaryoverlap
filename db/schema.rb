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

ActiveRecord::Schema.define(version: 2019_02_11_030058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "salary_data", force: :cascade do |t|
    t.string "email", null: false
    t.string "linkguid", null: false
    t.integer "low", null: false
    t.integer "high", null: false
    t.boolean "is_employer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["linkguid"], name: "index_salary_data_on_linkguid", unique: true
  end

end
