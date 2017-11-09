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

ActiveRecord::Schema.define(version: 20171109014133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "comments_posts", force: :cascade do |t|
    t.bigint "comment_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comments_posts_on_comment_id"
    t.index ["post_id"], name: "index_comments_posts_on_post_id"
  end

  create_table "comments_users", force: :cascade do |t|
    t.bigint "comment_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comments_users_on_comment_id"
    t.index ["user_id"], name: "index_comments_users_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "posts_users", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_posts_users_on_post_id"
    t.index ["user_id"], name: "index_posts_users_on_user_id"
  end

  create_table "rangers", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "email"
    t.string "password_digest"
    t.index ["email"], name: "users_email_key", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "comments_posts", "comments"
  add_foreign_key "comments_posts", "posts"
  add_foreign_key "comments_users", "comments"
  add_foreign_key "comments_users", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "posts_users", "posts"
  add_foreign_key "posts_users", "users"
end
