class DevoCompletionsController < ApplicationController
  def create
    @devo_completion = DevoCompletion.new(devo_completion_params)
    @plan = Devo.find(params[:devo_id]).plan

    if @devo_completion.save
      render json: @plan, status: :created, location: @plan
    else
      render json: @devo_completion.errors, status: :unprocessable_entity
    end
  end

  private

    def devo_completion_params
      params.require(:devo_completion).permit(:user_id, :devo_id)
    end
end
