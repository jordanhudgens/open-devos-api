class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :update, :destroy]
  skip_before_action :check_for_current_user, only: [:index, :show]

  def index
    @topics = Topic.all

    render json: @topics
  end

  def show
    render json: @topic
  end

  def create
    @topic = Topic.new(topic_params)

    authorize @topic

    if @topic.save
      render json: @topic, status: :created, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @topic
    if @topic.update(topic_params)
      render json: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @topic
    @topic.destroy
  end

  private
    def set_topic
      @topic = Topic.friendly.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title)
    end
end
