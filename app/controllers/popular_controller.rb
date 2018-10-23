class PopularController < ApplicationController
  def index
    Plan.order_by_most_recent.limit(9)
  end
end
