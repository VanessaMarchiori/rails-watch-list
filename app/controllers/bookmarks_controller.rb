class BookmarksController < ApplicationController
  before_action :set_list, only: %i[show, new]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: "bookmark was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
end

private

# Use callbacks to share common setup or constraints between actions.
def set_list
  @List = List.find(params[:list_id])
end

# Only allow a bookmark of trusted parameters through.
def bookmark_params
  params.require(:bookmark).permit(:comment, :movie,)
end
