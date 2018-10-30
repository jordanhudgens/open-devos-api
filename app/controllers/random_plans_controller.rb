class RandomPlansController < ApplicationController
  skip_before_action :check_for_current_user

  def index
    @random_plans = Plan.published.random_plans(2)

    render json: @random_plans
  end
end
