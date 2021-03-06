# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100417045523) do

  create_table "accounts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
    t.integer  "person_id"
    t.decimal  "price"
    t.date     "maturity_date"
    t.integer  "box_id"
    t.string   "document"
    t.integer  "contract_id"
    t.integer  "bank_account_id"
    t.integer  "situation_id"
    t.date     "payment_date"
    t.decimal  "payment_price"
  end

  create_table "bank_accounts", :force => true do |t|
    t.string   "name"
    t.decimal  "opening_balance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "opening_balance_date"
    t.integer  "bank_id"
  end

  create_table "banks", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  create_table "boxes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.integer  "people_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", :force => true do |t|
    t.string   "name"
    t.date     "date_registry"
    t.string   "document"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.string   "tipe"
    t.string   "identifier"
    t.string   "email"
  end

  create_table "sessions", :force => true do |t|
    t.integer  "user_id"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "situations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "encrypted_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
