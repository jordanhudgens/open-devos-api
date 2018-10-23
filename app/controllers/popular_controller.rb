class PopularController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]

  def index
    @plans = Plan.order_by_most_recent.limit(9)
    puts "X" * 500, params.inspect, "Y" * 500
    puts "X" * 500, @plans, "Y" * 500
    render json: @plans
  end
end
