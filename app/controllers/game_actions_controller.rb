class GameActionsController < ApplicationController
  def set_plant
    farm = Farm.find params[:farm_id]
    farm.set_plant params[:plant_type_id],
                   params[:x],
                   params[:y]
    send_data farm.get_content
  end

  def collect_plant
    farm = Farm.find params[:farm_id]
    farm.collect_plant params[:plant_id]
    send_data farm.get_content
  end

  def raise_time
    farm = Farm.find params[:farm_id]
    farm.raise_time
    send_data farm.get_content
  end

  def get_farm_content
    farm = Farm.find params[:farm_id]
    send_data farm.get_content
  end

end
