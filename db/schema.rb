# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_23_180055) do
  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "description"
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "description"
    t.integer "survey_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_type_id", null: false
    t.index ["question_type_id"], name: "index_questions_on_question_type_id"
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "replies", force: :cascade do |t|
    t.string "description"
    t.integer "question_id", null: false
    t.integer "survey_share_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_replies_on_question_id"
    t.index ["survey_share_id"], name: "index_replies_on_survey_share_id"
  end

  create_table "reply_options", force: :cascade do |t|
    t.integer "option_id", null: false
    t.integer "reply_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "checked"
    t.index ["option_id"], name: "index_reply_options_on_option_id"
    t.index ["reply_id"], name: "index_reply_options_on_reply_id"
  end

  create_table "survey_shares", force: :cascade do |t|
    t.integer "survey_id", null: false
    t.string "token"
    t.boolean "used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_survey_shares_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id", null: false
    t.string "used"
    t.index ["company_id"], name: "index_surveys_on_company_id"
  end

  add_foreign_key "options", "questions"
  add_foreign_key "questions", "question_types"
  add_foreign_key "questions", "surveys"
  add_foreign_key "replies", "questions"
  add_foreign_key "replies", "survey_shares"
  add_foreign_key "reply_options", "options"
  add_foreign_key "reply_options", "replies"
  add_foreign_key "survey_shares", "surveys"
  add_foreign_key "surveys", "companies"
end
