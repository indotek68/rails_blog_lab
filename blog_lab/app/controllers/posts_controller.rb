class PostsController < ApplicationController
 
 	def index
		@posts = Post.all
	end

	def new
	end

	def show
		id = params[:id]
		@post = Post.find(id)
	end

	def create
		post = params[:post].permit(:name, :author, :description)
		Post.create(post)

		# tag = params[:tag].permit(:name)
		# create_tag = Tag.create(tag)
		# find_or_create
		# create_post.tags << create_tag

		redirect_to "/show"
	end

	def update

	end

	def destroy
	end
end