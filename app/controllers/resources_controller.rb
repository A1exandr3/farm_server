class ResourcesController < ApplicationController
  def get_image
    send_file ImageInfo.get_image_by_id(params[:image_id]), :type => 'image/png'
  end

end
