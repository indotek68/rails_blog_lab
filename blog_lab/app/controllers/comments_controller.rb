class CommentsController < ApplicationController
	
	# def find
	# 	id = params[:id]
	# 	find_post = Post.find(id)
	# end

	def index
		post_id = params[:post_id]
		@find_post = Post.find(post_id)
		@comments = @find_post.comments
	end

	def new
		post_id = params[:post_id]
		@find_post = Post.find(post_id)

		@new_comment = @find_post.comments.new

	end

	def show
		post_id = params[:post_id]
		@find_post = Post.find(post_id)

		@comments = @find_post.comments
	end

end
