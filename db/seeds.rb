# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  #Фоновое изображение
  ImageInfo.create(:_file_path => '/BG.jpg')

  ImageInfo.create(:_file_path => '/clock.png')

  #Заполнение типов растений и стадий роста для каждого типа растений

  plant_type = PlantType.new :_name => 'Клевер'
  plant_type.image_info = ImageInfo.create :_file_path => '/clover/icon.png'
  plant_type.save

  GrowthStage.create :_min_bound => 0, :_max_bound => 100, :_is_collectable => false, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/clover/1.png')

  GrowthStage.create :_min_bound => 100, :_max_bound => 200, :_is_collectable => false, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/clover/2.png')

  GrowthStage.create :_min_bound => 200, :_max_bound => 300, :_is_collectable => false, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/clover/3.png')

  GrowthStage.create :_min_bound => 300, :_max_bound => 400, :_is_collectable => false, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/clover/4.png')

  GrowthStage.create :_min_bound => 400, :_max_bound => 500, :_is_collectable => true, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/clover/5.png')


  plant_type = PlantType.new :_name => 'Картофель'
  plant_type.image_info = ImageInfo.create :_file_path => '/potato/icon.png'
  plant_type.save

  GrowthStage.create :_min_bound => 0, :_max_bound => 100, :_is_collectable => false, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/potato/1.png')

  GrowthStage.create :_min_bound => 100, :_max_bound => 200, :_is_collectable => false, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/potato/2.png')

  GrowthStage.create :_min_bound => 200, :_max_bound => 300, :_is_collectable => false, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/potato/3.png')

  GrowthStage.create :_min_bound => 300, :_max_bound => 400, :_is_collectable => false, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/potato/4.png')

  GrowthStage.create :_min_bound => 400, :_max_bound => 500, :_is_collectable => true, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/potato/5.png')


  plant_type = PlantType.new :_name => 'Подсолнух'
  plant_type.image_info = ImageInfo.create :_file_path => '/sunflower/icon.png'
  plant_type.save

  GrowthStage.create :_min_bound => 0, :_max_bound => 100, :_is_collectable => false, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/sunflower/1.png')

  GrowthStage.create :_min_bound => 100, :_max_bound => 200, :_is_collectable => false, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/sunflower/2.png')

  GrowthStage.create :_min_bound => 200, :_max_bound => 300, :_is_collectable => false, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/sunflower/3.png')

  GrowthStage.create :_min_bound => 300, :_max_bound => 400, :_is_collectable => false, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/sunflower/4.png')

  GrowthStage.create :_min_bound => 400, :_max_bound => 500, :_is_collectable => true, :plant_type => plant_type,
    :image_info => ImageInfo.create(:_file_path => '/sunflower/5.png')



  #тестовая ферма с растениями
  farm = Farm.create

  for i in 1..9
    for j in 2..10
      Plant.create :plant_type_id => 1 + rand(3), :_x => i, :_y => j, :farm_id => farm, :life_time => 1 + rand(500)
    end
  end