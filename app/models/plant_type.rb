# == Schema Information
#
# Table name: plant_types
#
#  id            :integer         not null, primary key
#  _name         :string(255)
#  image_info_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_plant_types_on_id  (id)
#

class PlantType < ActiveRecord::Base
  belongs_to :image_info #иконка для типа растений
  has_many :growth_stages, :dependent => :destroy #доступные стадии роста для данного типа растений


end
