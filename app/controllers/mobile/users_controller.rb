class Mobile::UsersController < MobileController
  def show
    render json: current_user
  end

  def update
    user = User.find(params[:id])

    if params[:user][:role] == "admin"
      if current_user.admin
        if user.update(user_params)
          render json: user
        else
          render json: {
            errors: user.errors,
            status: 422,
            msg: 'ERROR_UPDATING'
          }
        end
      else
        render json: { status: 401, msg: "NOT_AUTHORIZED" }
      end
    elsif current_user.admin || current_user.id == params[:id].to_i
      if user.update(user_params)
        render json: user
      else
        render json: {
          errors: user.errors,
          status: 422,
          msg: 'ERROR_UPDATING'
        }
      end
    else
      render json: { status: 401, msg: "NOT_AUTHORIZED" }
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :full_name,
      :lat,
      :lng,
      :profile_slug,
      :location,
      :password,
      :password_confirmation
    )
  end
end
