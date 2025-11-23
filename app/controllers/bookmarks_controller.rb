class BookmarksController < ApplicationController
  before_action :set_list, only: [:create, :destroy, :edit, :update]
  before_action :set_bookmark, only: [:edit, :destroy, :edit, :update]

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
	  @bookmark.save
    redirect_to list_path(params[:list_id])
  end

  def edit
  end


  def update
    @bookmark.update(bookmark_params)
    redirect_to list_path(@list)
  end

  def destroy
	  @bookmark.destroy
    redirect_to list_path(@list),
    status: :see_other,
    notice: "Bookmark supprimé."
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
