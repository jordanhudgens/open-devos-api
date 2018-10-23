class PopularController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]

  def index
    puts "X" * 500, params.inspect, "Y" * 500
    render json: Plan.order_by_most_recent.limit(9)
  end
end
