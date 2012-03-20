# == Schema Information
#
# Table name: farms
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_farms_on_id  (id)
#

require "xml/libxml"

class Farm < ActiveRecord::Base
  has_many :plants, :dependent => :destroy #растения, принадлежащие ферме

  def set_plant plant_type_id, x, y
    Plant.create :plant_type_id => plant_type_id,
                 :_x => x,
                 :_y => y,
                 :farm_id => self.id
  end

  def collect_plant plant_id
    plant = self.plants.find plant_id
    if (!plant.nil? && plant.growth_stage._is_collectable?)
      plant.delete
    end
  end

  def raise_time
    Plant.transaction do
      self.plants.all.each do |plant|
        plant.life_time += 20
        unless plant.growth_stage.nil?
          plant.save
        else
          plant.delete
        end
      end
    end
  end

  # @return [XML] Описание растений, принадлежащих ферме
  def get_content
    xml_doc = XML::Document.new()
    xml_doc.root = XML::Node.new('plants')
    xml_root = xml_doc.root

    self.plants.all(:joins => :growth_stage,
                    :select => 'plants.*,
                                growth_stages.image_info_id as image_id,
                                growth_stages._is_collectable as collectable').each do |plant|
      xml_root << plant_node = XML::Node.new('plant')
      plant_node['id'] = plant.id.to_s
      plant_node['x'] = plant._x.to_s
      plant_node['y'] = plant._y.to_s
      plant_node['life_time'] = plant.life_time.to_s
      plant_node['collectable'] = plant.collectable.to_s
      plant_node['image_id'] = plant.image_id.to_s
    end

    xml_doc
  end

  # @return [XML] Описание возможных типов растений; координаты и размеры игрового поля
  def self.get_game_params
    xml_doc = XML::Document.new()
    xml_doc.root = XML::Node.new('farm_game')
    xml_root = xml_doc.root
    xml_root['grid_x'] = '740'
    xml_root['grid_y'] = '430'
    xml_root['grid_size'] = '630'
    xml_root['bg_image_id'] = CacheHolder.instance.get_bg_image_id
    xml_root['clock_icon_id'] = CacheHolder.instance.get_clock_icon_id

    CacheHolder.instance.get_plant_types.each_value do |plant_type|
      xml_root << plant_type_node = XML::Node.new('plant_type')
      plant_type_node['id'] = plant_type.id.to_s
      plant_type_node['name'] = plant_type._name
      plant_type_node['icon_image_id'] = plant_type.image_info_id.to_s
    end

    xml_doc
  end

end