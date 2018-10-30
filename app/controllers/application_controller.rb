class ApplicationController < ActionController::Base
  include Pundit
  include CurrentUserConcern
end
