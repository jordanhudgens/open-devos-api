class RandomPlansController < ApplicationController
  def index
    @random_plans = Plan.random_plans(2)

    render json: @random_plans
  end
end
