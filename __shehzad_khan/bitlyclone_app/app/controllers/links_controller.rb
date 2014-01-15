class LinksController < ApplicationController
	attr_accessor :url, :code
	def index
		@links = Link.all
	end
	def new
		@link = Link.new
	end
	def create
		
		@link = Link.new(link_params)
		@link.code = 10000 + rand(5000)
		@link.save
		redirect_to "/links/#{@link.id}"
	end
	def show
		flash[:notice] = "Here is your shortened link!"
		@link = Link.find(params[:id])
	end

	def redirect
		@link = Link.find_by_code!(params[:code])
		redirect_to "http://#{@link.url}"
	end

  def destroy
  	@link = Link.find(params[:id])
  	@link.delete
  	flash[:notice] = "Successfully Deleted"
  	redirect_to "/links/"
  end

	private
	def link_params
		params.require(:link).permit(:url, :code)
	end
end