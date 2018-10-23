class PopularController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]

  def index
    # TODO
  end
end
