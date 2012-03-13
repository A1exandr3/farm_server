class CreateImageInfos < ActiveRecord::Migration
  def change
    create_table :image_infos do |t|
      t.string :_file_path

      t.timestamps
    end

    add_index :image_infos, :id
  end
end
