# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180120131012) do

  create_table "demands", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "value"
    t.string   "rules"
    t.string   "user_id"
    t.string   "image_path"
    t.string   "short_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "tipo"
  end

  create_table "entregas", force: :cascade do |t|
    t.string   "user_id"
    t.string   "demand_id"
    t.string   "repository_link"
    t.string   "description"
    t.string   "title"
    t.string   "score"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "status"
  end

  create_table "offers", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "user_id"
    t.string   "video_url"
    t.string   "short_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "status"
    t.string   "value"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "tipo"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end