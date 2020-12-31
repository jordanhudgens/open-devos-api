class AuthorsController < ApplicationController
  skip_before_action :check_for_current_user, only: [:index]

  def index
    render json: Author.with_published_plans, each_serializer: AuthorSerializer
  end
end
