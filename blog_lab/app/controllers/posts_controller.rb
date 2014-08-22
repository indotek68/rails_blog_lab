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
		create_post = Post.create(post)

		tag = params[:tag].permit(:name)
		tag = params[:tag].split(",").map()

		create_tag = Tag.find_or_create_by(name: tag[:name])
		
		create_post.tags << create_tag

		redirect_to "/index"
	end

	def update
		tag = params[:tag].permit(:name)
		id = params[:id]

		found_post = Post.find(id)
		
		create_tag = Tag.find_or_create_by(name: tag[:name])
		
		puts create_tag

		post = params[:post].permit(:name, :author, :description)
		update_post = found_post.update_attributes(post)

		p "HELLLLLOOOO #{found_post.tags}"
		found_post.tags << create_tag
		
		redirect_to "/index"
	end

	def destroy
		id = params[:id]
		Post.find(id).destroy

		redirect_to "/index"
	end
end