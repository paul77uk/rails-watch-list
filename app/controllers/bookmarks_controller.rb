class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmarks_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # @list = List.find(params[:id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to status: :see_other
  end

  private

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
