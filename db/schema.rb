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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110802090259) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "type_of_client"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilitator_groups", :force => true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.integer  "facilitator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilitator_inputs", :force => true do |t|
    t.string   "location"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_group_id"
  end

  create_table "facilitators", :force => true do |t|
    t.integer  "user_id"
    t.integer  "facilitator_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "student_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", :force => true do |t|
    t.string   "name"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "option_number"
  end

  create_table "player_answers", :force => true do |t|
    t.integer  "player_id"
    t.integer  "question_id"
    t.string   "answer"
    t.integer  "answer_after_self_scoring"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "game_id"
    t.integer  "student_group_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "question_questionnaires", :force => true do |t|
    t.integer  "question_id"
    t.integer  "questionnaire_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questionnaire_questions", :force => true do |t|
    t.integer  "question_id"
    t.integer  "questionnaire_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questionnaire_settings", :force => true do |t|
    t.integer  "questionnaire_id"
    t.integer  "category_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questionnaires", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "statement"
    t.integer  "answer"
    t.integer  "type_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_group_questionnaires", :force => true do |t|
    t.integer  "student_group_id"
    t.integer  "questionnaire_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_group_settings", :force => true do |t|
    t.integer  "student_group_id"
    t.integer  "time_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_group_users", :force => true do |t|
    t.integer  "student_group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_groups", :force => true do |t|
    t.integer  "facilitator_group_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_questionnaire_id"
    t.integer  "pre_questionnaire_id"
    t.integer  "quiz_id"
  end

  create_table "student_routings", :force => true do |t|
    t.boolean  "pre_neg_taken"
    t.boolean  "post_neg_taken"
    t.boolean  "pre_neg_required"
    t.boolean  "post_neg_required"
    t.boolean  "planning"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temp_questions", :force => true do |t|
    t.string   "statement"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
  end

  create_table "temps", :force => true do |t|
    t.integer  "option_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "facilitator_group_id"
    t.string   "username"
    t.boolean  "admin"
    t.boolean  "educator"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
