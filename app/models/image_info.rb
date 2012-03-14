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

  def self.get_image_by_id image_id
    resource_path = Rails.root.to_s + '/resources'
    image_info = ImageInfo.find image_id
    File.new resource_path + image_info._file_path unless image_info.nil?
  end

end

