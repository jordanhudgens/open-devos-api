class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user, only: [:index, :show]

  def index
    @plans = Plan.all

    render json: @plans
  end

  def show
    render json: @plan
  end

  def user_plans
    render json: User.find(params['user_id']).plans
  end

  def last_plan
    user = User.find(params['user_id'])

    if user.plans.any?
      render json: user.plans.last
    else
      render json: { no_plans: true }
    end
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
    authorize @plan

    if @plan.update(plan_params)
      render json: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @plan
    @plan.destroy
  end

  private

    def set_topic
      # TODO
    end

    def set_plan
      @plan = Plan.friendly.find(params[:id])
    end

    def plan_params
      params.require(:plan).permit(
        :title,
        :user_id,
        :topic_id,
        :status,
        :summary,
        :plan_image
      )
    end
end
