class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|

      t.timestamps
    end

    add_index :farms, :id
  end
end
