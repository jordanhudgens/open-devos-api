class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :update, :destroy]
  skip_before_action :check_for_current_user, only: [:index, :show]

  def index
    if @current_user
      @plans = @current_user.plans.order_by_most_recent
    else
      @plans = Plan.published.order_by_most_recent
    end

    render json: @plans
  end

  def show
    if @current_user && @current_user.id == @plan.user_id
      puts "CURRENT USER" * 500, params.inspect, @current_user.inspect, "CURRENT_USER" * 500
      render json: @plan, published_and_draft: true
    else
      puts "NOT CURRENT USER" * 500, params.inspect, "NOT_CURRENT_USER" * 500
      render json: @plan, published_and_draft: false
    end
  end

  def user_plans
    render json: User.find(params['user_id']).plans
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
