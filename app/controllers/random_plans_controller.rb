class RandomPlansController < ApplicationController
  skip_before_action :check_for_current_user

  def index
    render json: Plan.published.random_plans(10)
  end
end
