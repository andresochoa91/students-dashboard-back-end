class RemoveFieldDescriptionFromSources < ActiveRecord::Migration[6.0]
  def change
    remove_column :sources, :description, :text
  end
end
