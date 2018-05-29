class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :update, :destroy]

  def index
    @plans = Plan.all

    render json: @plans
  end

  def show
    render json: @plan
  end

  def user_plans
    render json: Topic.all
  end

  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      render json: @plan, status: :created, location: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  def update
    if @plan.update(plan_params)
      render json: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @plan.destroy
  end

  private

    def set_topic
      # TODO
    end

    def set_plan
      @plan = Plan.find(params[:id])
    end

    def plan_params
      params.require(:plan).permit(
        :title,
        :user_id,
        :topic_id,
        :status
      )
    end
end
