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

end
