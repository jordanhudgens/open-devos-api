class DevoPositionsController < ApplicationController
  def update
    puts "ORDER>>>>>>>>>>>>>>" * 10, params['devos'], "<<<<<<<<<<<<<<<<<<<<<<ORDER"
    params[:devos].each_with_index do |id, index|
      Devo.find(id).update!(position: index)
    end
  end

  private

    def set_plan
      @plan = Plan.friendly.find(params[:id])
    end
end
