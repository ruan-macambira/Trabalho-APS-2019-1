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

ActiveRecord::Schema.define(version: 2019_09_07_234918) do

  create_table "article_authors", force: :cascade do |t|
    t.integer "article_id"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_authors_on_article_id"
    t.index ["author_id"], name: "index_article_authors_on_author_id"
  end

  create_table "article_proofreaders", force: :cascade do |t|
    t.integer "article_id"
    t.integer "professor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_proofreaders_on_article_id"
    t.index ["professor_id"], name: "index_article_proofreaders_on_professor_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "abstract"
    t.text "article"
    t.integer "status"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_articles_on_event_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_keywords", force: :cascade do |t|
    t.integer "event_id"
    t.integer "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_keywords_on_event_id"
    t.index ["keyword_id"], name: "index_event_keywords_on_keyword_id"
  end

  create_table "event_proofreaders", force: :cascade do |t|
    t.integer "event_id"
    t.integer "professor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_proofreaders_on_event_id"
    t.index ["professor_id"], name: "index_event_proofreaders_on_professor_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "initials"
    t.date "event_start"
    t.date "event_end"
    t.date "submission_start"
    t.date "submission_end"
    t.integer "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_events_on_field_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string "title"
    t.boolean "admin"
    t.integer "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_professors_on_field_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "registration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
