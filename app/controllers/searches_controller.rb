class SearchesController < ApplicationController

	def index
		if params[:search]
			@tweets = Tweet.search(params[:search].downcase).order("created_at DESC")
			@users = User.search(params[:search].downcase).order("created_at DESC")
		else
			@tweets = nil
			@users = nil
		end
	end
end