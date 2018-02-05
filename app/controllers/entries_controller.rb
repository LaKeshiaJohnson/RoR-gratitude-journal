class EntriesController < ApplicationController

	def index
		@entries = Entry.where(:user_id => session[:user_id])
	end

	def show
		@entry = Entry.find(params[:id])
	end

	def new
		@entry = Entry.new
	end

	def edit
		@entry = Entry.find(params[:id])
	end

	def create
		#@entry = @current_user.entries.new(params[:entry])

		@entry = Entry.new(entry_params)
		@entry.user_id = session[:user_id]

		if @entry.save
			redirect_to @entry
		else
			render 'new'
		end
	end

	def update
		@entry = Entry.find(params[:id])
		if @entry.update(entry_params)
			redirect_to @entry
		else
			render 'edit'
		end
	end

	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy

		redirect_to entries_path
	end

	private

		def entry_params
			params.require(:entry).permit(:body, :user_id)
		end

end
