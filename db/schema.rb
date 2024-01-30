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

ActiveRecord::Schema[7.1].define(version: 2024_01_29_234651) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "site"
    t.string "activity_branch", null: false
    t.string "company_organization", null: false
    t.string "cnpj", limit: 14, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnpj"], name: "index_companies_on_cnpj", unique: true
  end

  create_table "final_reports", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "effective_workload", null: false
    t.float "note", null: false
    t.string "applied_technique", null: false
    t.string "general_assessment", null: false
    t.string "professional_experience", null: false
    t.boolean "verifed_status"
    t.boolean "status_concept"
    t.uuid "internship_plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["internship_plan_id"], name: "index_final_reports_on_internship_plan_id"
  end

  create_table "internship_coordinators", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name", null: false
    t.string "cpf", limit: 11, null: false
    t.string "email", null: false
    t.string "faculty", null: false
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_internship_coordinators_on_confirmation_token", unique: true
    t.index ["cpf"], name: "index_internship_coordinators_on_cpf", unique: true
    t.index ["email"], name: "index_internship_coordinators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_internship_coordinators_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_internship_coordinators_on_uid_and_provider", unique: true
    t.index ["unlock_token"], name: "index_internship_coordinators_on_unlock_token", unique: true
  end

  create_table "internship_plans", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.text "general_objective", null: false
    t.text "specific_objective", null: false
    t.date "start_date", null: false
    t.date "final_date", null: false
    t.string "expected_result", null: false
    t.integer "workload", null: false
    t.boolean "status_concept"
    t.uuid "trainee_id", null: false
    t.uuid "internship_supervisor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["internship_supervisor_id"], name: "index_internship_plans_on_internship_supervisor_id"
    t.index ["trainee_id"], name: "index_internship_plans_on_trainee_id"
  end

  create_table "internship_supervisors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name", null: false
    t.string "cpf", limit: 11, null: false
    t.string "email", null: false
    t.string "function", null: false
    t.uuid "company_id", null: false
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_internship_supervisors_on_company_id"
    t.index ["confirmation_token"], name: "index_internship_supervisors_on_confirmation_token", unique: true
    t.index ["cpf"], name: "index_internship_supervisors_on_cpf", unique: true
    t.index ["email"], name: "index_internship_supervisors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_internship_supervisors_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_internship_supervisors_on_uid_and_provider", unique: true
    t.index ["unlock_token"], name: "index_internship_supervisors_on_unlock_token", unique: true
  end

  create_table "tasks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "start_date", null: false
    t.date "final_date", null: false
    t.text "description", null: false
    t.boolean "status"
    t.uuid "internship_plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["internship_plan_id"], name: "index_tasks_on_internship_plan_id"
  end

  create_table "trainees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name", null: false
    t.string "cpf", limit: 11, null: false
    t.string "email", null: false
    t.integer "class_room", null: false
    t.integer "conclusion_year", null: false
    t.string "studentId_number", null: false
    t.boolean "is_actived"
    t.uuid "internship_coordinator_id", null: false
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_trainees_on_confirmation_token", unique: true
    t.index ["cpf"], name: "index_trainees_on_cpf", unique: true
    t.index ["email"], name: "index_trainees_on_email", unique: true
    t.index ["internship_coordinator_id"], name: "index_trainees_on_internship_coordinator_id"
    t.index ["reset_password_token"], name: "index_trainees_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_trainees_on_uid_and_provider", unique: true
    t.index ["unlock_token"], name: "index_trainees_on_unlock_token", unique: true
  end

  add_foreign_key "final_reports", "internship_plans"
  add_foreign_key "internship_plans", "internship_supervisors"
  add_foreign_key "internship_plans", "trainees"
  add_foreign_key "internship_supervisors", "companies"
  add_foreign_key "tasks", "internship_plans"
  add_foreign_key "trainees", "internship_coordinators"
end
