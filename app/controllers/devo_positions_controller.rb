class DevoPositionsController < ApplicationController
  def update
    devos = Devo.where(id: params[:devos])

    params[:devos].each_with_index do |devo_index, index|
      Devo.find(devo_index).update!(position: index)
    end

    render json: devos.order('position asc')
  end

  private

    def set_plan
      @plan = Plan.friendly.find(params[:id])
    end
end
