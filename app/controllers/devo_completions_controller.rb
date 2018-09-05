class DevoCompletionsController < ApplicationController
  def index
    @completed_devos = DevoCompletion.where(user_id: params[:user_id]).pluck(:devo_id)

    render json: @completed_devos
  end

  def create
    @devo_completion = DevoCompletion.new(devo_completion_params)
    puts "DEVO COMPLETION PARAMS" * 100, params.inspect
    @plan = Devo.find(params[:devo_completion][:devo_id]).plan

    if @devo_completion.save
      render json: @plan, status: :created, location: @plan
    else
      render json: @devo_completion.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @devo_completion = DevoCompletion.find_by_devo_id(params[:devo_id])
    @devo_completion.destroy
  end

  private

    def devo_completion_params
      params.require(:devo_completion).permit(:user_id, :devo_id)
    end
end
