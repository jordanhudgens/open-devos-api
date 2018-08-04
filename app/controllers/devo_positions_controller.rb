class DevoPositionsController < ApplicationController
  def update
    devos = Devo.where(id: params[:devos])

    devos.each_with_index do |devo, index|
      devo.update!(position: index)
    end

    render json: devos.order('position asc')
  end

  private

    def set_plan
      @plan = Plan.friendly.find(params[:id])
    end
end
