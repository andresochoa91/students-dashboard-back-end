class CreateLessonsSources < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons_sources do |t|
      t.integer :lesson_id
      t.integer :source_id

      t.timestamps
    end
  end
end
