class DevosController < ApplicationController
  before_action :set_devo, only: [:show, :update, :destroy]

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
    if @devo.update(devo_params)
      render json: @devo
    else
      render json: @devo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @devo.destroy
  end

  private
    def set_devo
      @devo = Devo.find(params[:id])
    end

    def devo_params
      params.require(:devo).permit(
        :title,
        :content,
        :position,
        :status
      )
    end
end
