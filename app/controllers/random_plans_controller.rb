class RandomPlansController < ApplicationController
  skip_before_action :check_for_current_user

  def index
    render json: DataStore.featured_plans.current_version
  end
end
