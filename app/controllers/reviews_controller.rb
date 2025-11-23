class ReviewsController < ApplicationController
  before_action :set_list, only: [:create, :new, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.list = @list
    @review.save
    redirect_to list_path(params[:list_id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@list),
    status: :see_other,
    notice: "Review supprimé."
  end

  private

  def review_params
    params.require(:review).permit(:comment, :stars, :list_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
