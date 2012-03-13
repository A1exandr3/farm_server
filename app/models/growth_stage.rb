# == Schema Information
#
# Table name: growth_stages
#
#  id              :integer         not null, primary key
#  _max_bound      :integer
#  _min_bound      :integer
#  _is_collectable :boolean
#  image_info_id   :integer
#  plant_type_id   :integer
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_growth_stages_on_id  (id)
#

class GrowthStage < ActiveRecord::Base
  belongs_to :image_info #изображение стадии роста
  belongs_to :plant_type

end

