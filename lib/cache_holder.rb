# Класс-кэш содержит хэши изображений и типов растений, позволяет получать их без обращения к базе

require 'singleton'

class CacheHolder
  include Singleton

  def initialize
    #кэш для изображений
    @images = Hash.new
    resource_path = Rails.root.to_s + '/resources'
    ImageInfo.all.each do |image|
      @images[image.id] = File.new(resource_path + image._file_path)
    end

    #кэш для типов растений с доступными стадиями роста
    @plant_meta_info = Hash.new
    #кэш для типов растений
    @plant_types = Hash.new
    PlantType.all.each do |plant_type|
      @plant_meta_info[plant_type.id] = plant_type.growth_stages.all
      @plant_types[plant_type.id] = plant_type
    end

    #файл фонового изображения
    @bg_image_id = ImageInfo.find_by__file_path('/BG.jpg').id.to_s
  end

  def get_images
    @images
  end

  def get_plant_types
    @plant_types
  end

  def get_plant_meta_info
    @plant_meta_info
  end

  def get_bg_image_id
    @bg_image_id
  end

end