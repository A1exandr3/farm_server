class CreateGrowthStages < ActiveRecord::Migration
  def change
    create_table :growth_stages do |t|
      t.integer :_max_bound
      t.integer :_min_bound
      t.boolean :_is_collectable

      t.references :image_info
      t.references :plant_type

      t.timestamps
    end

    add_index :growth_stages, :id
  end
end
