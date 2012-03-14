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

class Farm < ActiveRecord::Base
  has_many :plants, :dependent => :destroy #растения, принадлежащие ферме

  def set_plant plant_type_id, x, y
    Plant.create :plant_type_id => plant_type_id,
                 :x => x,
                 :y => y,
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

  end

end
