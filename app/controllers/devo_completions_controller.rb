class DevoCompletionsController < ApplicationController
  def index
    @completed_devos = DevoCompletion.where(user_id: params[:user_id])

    if @completed_devos.any?
      @completed_devo_ids = @completed_devos.pluck(:devo_id)

      render json: @completed_devo_ids
    else
      render json: @completed_devos
    end
  end

  def create
    @devo_completion = DevoCompletion.new(devo_completion_params)
    @plan = Devo.find(params[:devo_completion][:devo_id]).plan

    if @devo_completion.save
      render json: @plan, status: :created, location: @plan
    else
      render json: @devo_completion.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @devo_completion = DevoCompletion.find_by_devo_id(params[:id])
    @devo_completion.destroy
  end

  private

    def devo_completion_params
      params.require(:devo_completion).permit(:user_id, :devo_id)
    end
end
