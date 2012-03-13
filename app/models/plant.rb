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

class Plant < ActiveRecord::Base
  belongs_to :farm
  belongs_to :plant_type
  belongs_to :growth_stage


end

