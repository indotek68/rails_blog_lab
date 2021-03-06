class PostsController < ApplicationController
 
 	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def show
		id = params[:id]
		@post = Post.find(id)
	end

	def edit
		id = params[:id]
		@post = Post.find(id)
	end

	def create
		post = params[:post].permit(:name, :author, :description)
		create_post = Post.create(post)

		tag = params[:tag].permit(:name)
		# tag = params[:tag].split(",").map()

		create_tag = Tag.find_or_create_by(name: tag[:name])
		
		create_post.tags << create_tag

		redirect_to post
	end

	def update
		# tag = params[:tag].permit(:name)
		id = params[:id]
		found_post = Post.find(id)
		tag = params[:tag].permit(:name)
		
		create_tag = Tag.find_or_create_by(name: tag[:name])
		post = params[:post].permit(:name, :author, :description)
		update_post = found_post.update_attributes(post)
		found_post.tags.clear

		found_post.tags << create_tag
		redirect_to post_path
	end

	def destroy
		id = params[:id]
		Post.find(id).destroy

		redirect_to posts_path
	end
end