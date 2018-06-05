class ApplicationController < ActionController::API
  include TokenAuthenticatable
  include Pundit
end
