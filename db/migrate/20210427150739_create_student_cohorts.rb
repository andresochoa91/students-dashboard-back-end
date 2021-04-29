class CreateStudentCohorts < ActiveRecord::Migration[6.0]
  def change
    create_table :student_cohorts do |t|
      t.references :student, null: false, foreign_key: true
      t.references :cohort, null: false, foreign_key: true

      t.timestamps
    end
  end
end
