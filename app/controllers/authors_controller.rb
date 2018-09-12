class AuthorsController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]

  def index
    @authors = User.authors
  end
end
