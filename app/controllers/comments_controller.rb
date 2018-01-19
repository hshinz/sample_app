class CommentsController < ApplicationController
	before_action :logged_in_user
	before_action :load_comment, only: [:edit, :update, :destroy]
	before_action :load_post

	def create
		@comment = Comment.new comment_params
		if @comment.save
			# flash[:success] = "Create comment successfully"
			# redirect_back(fallback_location: root_path)
			respond_to do |format|
				format.html 
				format.js
				format.json
			end
		else
			# flash[:success] = "Create comment failed"
			# redirect_back(fallback_location: root_path)
			respond_to do |format|
				format.html
				format.js
				format.json
			end
		end
	end

	def edit
	end

	def update
		if @comment.update_attributes comment_params
			# flash[:success] = "Update comment successfully"
			# redirect_to @comment.post
			respond_to do |format|
				format.html 
				format.js
				format.json
			end
		else
			# flash.now[:danger] = "Update comment failed"		
			# render :edit
			respond_to do |format|
				format.html 
				format.js
				format.json
			end
		end
	end

	def destroy
		# Comment.find(params[:id]).destroy
		# flash[:success] = "Comment deleted"
		# redirect_to @post
		if @comment.destroy
			respond_to do |format|
				format.html 
				format.js
				format.json
			end
		else
			respond_to do |format|
				format.html 
				format.js
				format.json
			end
		end
	end

	private
	def comment_params
		params.require(:comment).permit :user_id, :post_id, :content
	end

	def load_comment
		@comment = current_user.comments.find_by id: params[:id]
		return if @comment
		flash.now[:danger] = "Access denied"
		redirect_to root_path unless @comment
	end

	def load_post
		@post = Post.find_by id: params[:post_id]
		redirect_to root_path unless @post
	end

end
