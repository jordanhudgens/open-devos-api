class DevoPositionsController < ApplicationController
  def update
    puts "ORDER>>>>>>>>>>>>>>" * 10, params[:order], "<<<<<<<<<<<<<<<<<<<<<<ORDER"
    params[:order].each do |key, value|
      Devo.find(value[:id]).update(position: value[:position])
    end
  end

  private

    def set_plan
      @plan = Plan.friendly.find(params[:id])
    end
end
