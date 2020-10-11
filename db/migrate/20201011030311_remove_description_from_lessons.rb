class RemoveDescriptionFromLessons < ActiveRecord::Migration[6.0]
  def change
    remove_column :lessons, :description, :text
  end
end
