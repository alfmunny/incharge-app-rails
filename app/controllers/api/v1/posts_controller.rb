class Api::V1::PostsController < ApplicationController
	respond_to :json

	def index
		respond_with Post.all
	end

	def show
		respond_with Post.find(params[:id])
	end

	def create
		respond_with Post.create(post_params), location: nil
	end

	def update
		respond_with Post.update(params[:id], post_params)
	end

	def destroy
		respond_with Post.destroy(params[:id])
	end

	private
	def post_params
		params.require(:post).permit(:title, :intro, :extended, :published_at, :author)
	end
end