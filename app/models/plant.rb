# == Schema Information
#
# Table name: plants
#
#  id              :integer         not null, primary key
#  _x              :integer
#  _y              :integer
#  _life_time      :integer
#  farm_id         :integer
#  plant_type_id   :integer
#  growth_stage_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_plants_on_farm_id  (farm_id)
#  index_plants_on_id       (id)
#

require 'cache_holder'

class Plant < ActiveRecord::Base
  belongs_to :farm
  belongs_to :plant_type
  belongs_to :growth_stage

  validates_presence_of :_x, :_y, :_life_time, :farm_id, :growth_stage_id, :plant_type_id

  before_validation :on_before_validation

  def life_time
    self._life_time
  end
  def life_time= time
    self._life_time = time
    self.recalculate_growth_stage
  end

  #Устанавливает значение по умолчанию для созданного растения
  def on_before_validation
    self.life_time ||= 1
  end

  #пересчитвает стадию роста растения в зависимости от его времени жизни
  def recalculate_growth_stage
    CacheHolder.instance.get_plant_meta_info[self.plant_type_id].each do |growth_stage|
      self.growth_stage = nil
      if (self.life_time > growth_stage._min_bound && self.life_time <= growth_stage._max_bound)
        self.growth_stage = growth_stage
        break
      end
    end
  end

end

