class PopularController < ApplicationController
  skip_before_action :check_for_current_user, only: [:index]

  def index
    @plans = Plan.order_by_most_popular.limit(9)
    render json: @plans
  end
end
