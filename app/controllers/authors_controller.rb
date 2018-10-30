class AuthorsController < ApplicationController
  skip_before_action :check_for_current_user, only: [:index]

  def index
    @authors = User.authors

    render json: @authors, each_serializer: AuthorSerializer
  end
end
