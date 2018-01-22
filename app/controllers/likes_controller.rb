class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    # @like = Like.new post_id: @post.id, user_id: current_user.id
    # @like = Like.new like_params
    # @like.user = current_user
    @like = current_user.likes.new like_params
    # @like = @post.likes.new
    # @like.user = current_user

    if @like.save
      flash[:success] = "Liked"
      redirect_to @like.post
    else
      flash[:success] = "Not success"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  end

  private
  
  def like_params
    params.require(:like).permit :post_id
  end
end
