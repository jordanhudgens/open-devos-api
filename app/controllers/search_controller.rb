class SearchController < ApplicationController
  def search
    @devos = Devo.search_by_term(params[:query])

    render json: @devos
  end
end
