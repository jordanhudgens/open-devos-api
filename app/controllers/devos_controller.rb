class DevosController < ApplicationController
  before_action :set_devo, only: [:show, :update, :destroy]

  # GET /devos
  def index
    @devos = Devo.all

    render json: @devos
  end

  # GET /devos/1
  def show
    render json: @devo
  end

  # POST /devos
  def create
    @devo = Devo.new(devo_params)

    if @devo.save
      render json: @devo, status: :created, location: @devo
    else
      render json: @devo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /devos/1
  def update
    if @devo.update(devo_params)
      render json: @devo
    else
      render json: @devo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /devos/1
  def destroy
    @devo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devo
      @devo = Devo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def devo_params
      params.require(:devo).permit(:user_id, :title, :content, :position, :status)
    end
end
