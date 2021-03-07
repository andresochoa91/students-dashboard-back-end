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

ActiveRecord::Schema.define(version: 2021_02_24_023525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "link"
    t.text "description"
    t.integer "lesson_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "resources"
    t.text "assignment"
    t.index ["lesson_id"], name: "index_assignments_on_lesson_id"
  end

  create_table "course_units", force: :cascade do |t|
    t.integer "course_id"
    t.integer "unit_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lesson_sources", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "source_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "lesson_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "sources", force: :cascade do |t|
    t.string "source_title"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "student_courses", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_student_courses_on_course_id"
    t.index ["student_id"], name: "index_student_courses_on_student_id"
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

  create_table "unit_lessons", force: :cascade do |t|
    t.integer "unit_id"
    t.integer "lesson_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "unit_name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  add_foreign_key "mentors", "users"
  add_foreign_key "registered_mentor_sessions", "mentor_courses"
  add_foreign_key "registered_mentor_sessions", "student_weekly_progresses"
  add_foreign_key "staffs", "users"
  add_foreign_key "student_courses", "courses"
  add_foreign_key "student_courses", "students"
  add_foreign_key "student_weekly_progresses", "students"
  add_foreign_key "student_weekly_progresses", "units"
  add_foreign_key "student_weekly_progresses", "weeks"
  add_foreign_key "students", "users"
end
