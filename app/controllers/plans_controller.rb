class PlansController < ApplicationController
  include CurrentUserConcern
  before_action :set_plan, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user, only: [:index, :show]
  before_action :check_for_current_user

  def index
    @plans = Plan.published.order_by_most_recent.limit(10)

    render json: @plans
  end

  def show
    puts "CURRENT USER PLANS" * 500, @current_user.inspect, "PLANS" * 500

    if @current_user && @current_user.id == @plan.user_id
      render json: @plan, published_and_draft: true
    else
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
