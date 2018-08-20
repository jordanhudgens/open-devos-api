class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]

  def index
    @bookmarks = Bookmark.all

    render json: @bookmarks
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      render json: @bookmark, status: :created, location: @bookmark
    else
      render json: @bookmark.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
  end

  private
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def bookmark_params
      params.require(:bookmark).permit(:user_id, :plan_id)
    end
end
