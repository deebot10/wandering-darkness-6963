class CreatePlottedPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plotted_plants do |t|
      t.references :plant, foreign_key: true
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
