class PagesController < ApplicationController
  skip_before_action :check_for_current_user

  def home
    render json: { status: 200 }
  end
end
