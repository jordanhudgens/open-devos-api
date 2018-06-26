class DevosController < ApplicationController
  before_action :set_devo, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user, only: [:index, :show]

  def index
    @devos = Devo.all

    render json: @devos
  end

  def show
    render json: @devo
  end

  def create
    @devo = Devo.new(devo_params)

    if @devo.save
      render json: @devo, status: :created, location: @devo
    else
      render json: @devo.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @devo

    if @devo.update(devo_params)
      render json: @devo
    else
      render json: @devo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @devo
    @devo.destroy
  end

  private
    def set_devo
      @devo = Devo.friendly.find(params[:id])
    end

    def devo_params
      params.require(:devo).permit(
        :title,
        :content,
        :position,
        :status,
        :plan_id,
        :featured_image
      )
    end
end
