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

ActiveRecord::Schema.define(version: 2019_09_23_040107) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.text "title"
    t.text "abstract"
    t.integer "status"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.index ["event_id"], name: "index_articles_on_event_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "articles_authors", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "article_id", null: false
    t.index ["article_id", "author_id"], name: "index_articles_authors_on_article_id_and_author_id"
    t.index ["author_id", "article_id"], name: "index_articles_authors_on_author_id_and_article_id"
  end

  create_table "articles_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "article_id", null: false
    t.index ["article_id", "user_id"], name: "index_articles_users_on_article_id_and_user_id"
    t.index ["user_id", "article_id"], name: "index_articles_users_on_user_id_and_article_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "initials"
    t.date "event_start"
    t.date "event_finish"
    t.date "submission_start"
    t.date "submission_finish"
    t.integer "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name"
    t.index ["field_id"], name: "index_events_on_field_id"
  end

  create_table "events_keywords", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "keyword_id", null: false
    t.index ["event_id", "keyword_id"], name: "index_events_keywords_on_event_id_and_keyword_id"
    t.index ["keyword_id", "event_id"], name: "index_events_keywords_on_keyword_id_and_event_id"
  end

  create_table "events_users", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id", null: false
    t.index ["event_id", "user_id"], name: "index_events_users_on_event_id_and_user_id"
    t.index ["user_id", "event_id"], name: "index_events_users_on_user_id_and_event_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "type"
    t.integer "role"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "institution"
    t.string "registration"
    t.string "title"
    t.integer "field_id"
    t.index ["author_id"], name: "index_users_on_author_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["field_id"], name: "index_users_on_field_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
