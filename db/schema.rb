# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_27_150739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.text "description"
    t.integer "lesson_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_assignments_on_lesson_id"
  end

  create_table "cohort_courses", force: :cascade do |t|
    t.integer "cohort_id"
    t.integer "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cohort_id"], name: "index_cohort_courses_on_cohort_id"
    t.index ["course_id"], name: "index_cohort_courses_on_course_id"
  end

  create_table "cohorts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "course_units", force: :cascade do |t|
    t.integer "course_id"
    t.integer "unit_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lesson_assignments", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.bigint "assignment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_id"], name: "index_lesson_assignments_on_assignment_id"
    t.index ["lesson_id"], name: "index_lesson_assignments_on_lesson_id"
  end

  create_table "lesson_materials", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "lesson_id"
    t.integer "material_id"
  end

  create_table "lesson_sources", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "source_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "duration"
    t.text "learning_objectives"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.string "name"
  end

  create_table "materials", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.string "platform"
    t.string "treehouse_type"
    t.string "instructor"
    t.string "duration"
    t.text "learning_objectives"
    t.text "notes"
  end

  create_table "mentor_courses", force: :cascade do |t|
    t.integer "mentor_id"
    t.integer "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.time "start_time"
    t.time "end_time"
    t.string "day"
    t.index ["course_id"], name: "index_mentor_courses_on_course_id"
    t.index ["mentor_id"], name: "index_mentor_courses_on_mentor_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_mentors_on_user_id"
  end

  create_table "registered_mentor_sessions", force: :cascade do |t|
    t.integer "week_number"
    t.integer "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "comments"
    t.bigint "student_weekly_progress_id", null: false
    t.bigint "mentor_course_id", null: false
    t.index ["mentor_course_id"], name: "index_registered_mentor_sessions_on_mentor_course_id"
    t.index ["student_weekly_progress_id"], name: "index_registered_mentor_sessions_on_student_weekly_progress_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_staffs_on_user_id"
  end

  create_table "student_assignments", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "material_id", null: false
    t.integer "status"
    t.string "assignment_submission"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "assignment_id", null: false
    t.index ["assignment_id"], name: "index_student_assignments_on_assignment_id"
    t.index ["material_id"], name: "index_student_assignments_on_material_id"
    t.index ["student_id"], name: "index_student_assignments_on_student_id"
  end

  create_table "student_cohorts", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "cohort_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cohort_id"], name: "index_student_cohorts_on_cohort_id"
    t.index ["student_id"], name: "index_student_cohorts_on_student_id"
  end

  create_table "student_courses", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_student_courses_on_course_id"
    t.index ["student_id"], name: "index_student_courses_on_student_id"
  end

  create_table "student_materials", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "material_id", null: false
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_student_materials_on_material_id"
    t.index ["student_id"], name: "index_student_materials_on_student_id"
  end

  create_table "student_weekly_progresses", force: :cascade do |t|
    t.integer "total_progress"
    t.integer "week_number"
    t.string "assignment_submission"
    t.integer "instructions_progress"
    t.integer "resources_progress"
    t.integer "assignment_progress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "week_id", null: false
    t.bigint "student_id", null: false
    t.bigint "unit_id", null: false
    t.index ["student_id"], name: "index_student_weekly_progresses_on_student_id"
    t.index ["unit_id"], name: "index_student_weekly_progresses_on_unit_id"
    t.index ["week_id"], name: "index_student_weekly_progresses_on_week_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "enrolled"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "tassignments", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tcourse_tunits", force: :cascade do |t|
    t.integer "tcourse_id"
    t.integer "tunit_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tcourse_id"], name: "index_tcourse_tunits_on_tcourse_id"
    t.index ["tunit_id"], name: "index_tcourse_tunits_on_tunit_id"
  end

  create_table "tcourses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tlesson_tassignments", force: :cascade do |t|
    t.integer "tlesson_id"
    t.integer "tassignment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tassignment_id"], name: "index_tlesson_tassignments_on_tassignment_id"
    t.index ["tlesson_id"], name: "index_tlesson_tassignments_on_tlesson_id"
  end

  create_table "tlesson_tmaterials", force: :cascade do |t|
    t.integer "tlesson_id"
    t.integer "tmaterial_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tlesson_id"], name: "index_tlesson_tmaterials_on_tlesson_id"
    t.index ["tmaterial_id"], name: "index_tlesson_tmaterials_on_tmaterial_id"
  end

  create_table "tlessons", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "duration"
    t.text "learning_objectives"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tmaterials", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.text "description"
    t.string "platform"
    t.string "treehouse_type"
    t.string "instructor"
    t.string "duration"
    t.text "learning_objectives"
    t.string "tools"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tunit_tlessons", force: :cascade do |t|
    t.integer "tunit_id"
    t.integer "tlesson_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tlesson_id"], name: "index_tunit_tlessons_on_tlesson_id"
    t.index ["tunit_id"], name: "index_tunit_tlessons_on_tunit_id"
  end

  create_table "tunits", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "unit_lessons", force: :cascade do |t|
    t.integer "unit_id"
    t.integer "lesson_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "week_number"
    t.integer "course_id"
    t.integer "unit_id"
    t.integer "lesson_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_weeks_on_course_id"
    t.index ["lesson_id"], name: "index_weeks_on_lesson_id"
    t.index ["unit_id"], name: "index_weeks_on_unit_id"
  end

  add_foreign_key "lesson_assignments", "assignments"
  add_foreign_key "lesson_assignments", "lessons"
  add_foreign_key "mentors", "users"
  add_foreign_key "registered_mentor_sessions", "mentor_courses"
  add_foreign_key "registered_mentor_sessions", "student_weekly_progresses"
  add_foreign_key "staffs", "users"
  add_foreign_key "student_assignments", "assignments"
  add_foreign_key "student_assignments", "materials"
  add_foreign_key "student_assignments", "students"
  add_foreign_key "student_cohorts", "cohorts"
  add_foreign_key "student_cohorts", "students"
  add_foreign_key "student_courses", "courses"
  add_foreign_key "student_courses", "students"
  add_foreign_key "student_materials", "materials"
  add_foreign_key "student_materials", "students"
  add_foreign_key "student_weekly_progresses", "students"
  add_foreign_key "student_weekly_progresses", "units"
  add_foreign_key "student_weekly_progresses", "weeks"
  add_foreign_key "students", "users"
end
