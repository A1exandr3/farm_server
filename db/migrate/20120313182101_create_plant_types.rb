class CreatePlantTypes < ActiveRecord::Migration
  def change
    create_table :plant_types do |t|
      t.string :_name

      t.references :image_info

      t.timestamps
    end

    add_index :plant_types, :id
  end
end
