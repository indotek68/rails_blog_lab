class TagsController < ApplicationController
	def index
		@tags = Tag.all.select do |tag|
			tag.posts.length > 0
		end	
		# render :index
	end

	def show
		id = params[:id]
		@tag = Tag.find(id)
	end
end