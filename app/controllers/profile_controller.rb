class Mobile::ProfileController < MobileController
  skip_before_action :authenticate_user

  def show
    user = User.find_by(slug: params[:id])

    puts "Current user in profile" * 500, current_user.inspect, "current user in profile" * 500
    # if user && @current_user && (@current_user.id == user.id)
    #   @plans = user.plans
    #   render json: @plans
    # end

    if user
      plans = user.plans.published
      render json: plans
    else
      render json: {
        message: 'Could not find user',
        status: 404
      }
    end
  end
end
