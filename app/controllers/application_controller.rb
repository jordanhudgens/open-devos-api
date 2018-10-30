class ApplicationController < ActionController::API
  include Pundit
  include CurrentUserConcern
end
