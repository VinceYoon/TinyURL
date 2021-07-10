class LinksController < ApplicationController

	def show
		link = get_link
		if tiny_url.increase_visits_counter
			redirect_to link.original_url, status: 301
			return
		else
			render '/home/index'
		end
	end

	def info
		@link = get_link
	end

	def create
		@link = Link.new(link_params)
		save_result ||= @link.save

		if save_result
			@links = Link.all
		end
	end

private
	
	def get_link
		Link.find_by(token: params[:token])
	end

	def link_params
		params.require(:link).permit(:original_url)
	end
end