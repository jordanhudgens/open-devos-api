class SearchController < ApplicationController
  skip_before_action :check_for_current_user

  def search
    devos = Devo.search_by_term(params[:query])

    render json: devos
  end
end
