class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string :title
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
