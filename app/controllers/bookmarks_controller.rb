class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]

  def index
    @bookmarks = User.find(params['user_id']).bookmarks

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
    puts "BOOOOOKMARK DELETE" * 100, @bookmark, params.inspect, "BOOOOOOOO" * 100
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
