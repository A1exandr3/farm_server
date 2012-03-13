class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.integer :_x
      t.integer :_y
      t.integer :_life_time

      t.references :farm
      t.references :plant_type
      t.references :growth_stage

      t.timestamps
    end

    add_index :plants, :id
    add_index :plants, :farm_id
  end
end
