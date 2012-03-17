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

require 'cache_holder'

class ImageInfo < ActiveRecord::Base

  # @param image_id [integer] id изображения
  # @return [Object] изображение из кэша
  def self.get_image_by_id image_id
    CacheHolder.instance.get_images[image_id.to_i]
  end

end

