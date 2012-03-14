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

end