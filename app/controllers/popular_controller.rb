class PopularController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]

  def index
    Plan.order_by_most_recent.limit(9)
  end
end
