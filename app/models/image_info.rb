# == Schema Information
#
# Table name: image_infos
#
#  id         :integer         not null, primary key
#  _file_path :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_image_infos_on_id  (id)
#

class ImageInfo < ActiveRecord::Base
end

