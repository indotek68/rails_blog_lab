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

		@comment = @find_post.comments.find_by_id(params[:id])
		p "---------------------"
		p @comment	
	end

	def edit
		post_id = params[:post_id]
		@find_post = Post.find(post_id)

		@comment = @find_post.comments.find(params[:id])
	end

	def create
		post_id = params[:post_id]
		@find_post = Post.find(post_id)

		new_comment = params.require(:comment).permit(:name, :author, :body)
		@new_comment = @find_post.comments.new(new_comment)

		if @new_comment.save
			redirect_to [@find_post, @new_comment]
		else
			render action: 'new'
		end
	end

	def update
		post_id = params[:post_id]
		@find_post = Post.find(post_id)
		@comment = @find_post.comments.find(params[:id])

		comment = params.require(:comment).permit(:name, :author, :body)
		@found_comment = @find_post.comments.find(params[:id]) 
		@update_comment = @found_comment.update_attributes(comment)

		redirect_to post_comment_path
	end

	def destroy
		post_id = params[:post_id]
		@find_post = Post.find(post_id)

		@found_comment = @find_post.comments.find(params[:id])
		@found_comment.destroy
		redirect_to post_comments_path
	end
end
