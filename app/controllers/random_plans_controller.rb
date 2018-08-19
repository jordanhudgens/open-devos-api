class RandomPlansController < ApplicationController
  skip_before_action :authenticate_user

  def index
    @random_plans = Plan.published.random_plans(2)

    render json: @random_plans
  end
end
