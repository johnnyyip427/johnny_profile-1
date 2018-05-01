class MessagesController < ApplicationController


before_action :authorize, :only=>[:new] 


	def index
		@messages = Message.all
		#@messages = Message.where(id: (current_user.id))
		p "========================"
		# p params
		p "index"
		#p current_user
		# p @messages
		p "========================"
		# simons work
		# @messages = Message.where(id:(user.id))
	end

	# def show
	# 	# p params
	# 	# @message = params[:id]
	# 	# p @message
	# 	# # redirect_to root_path
	# end

	def new
		@message = Message.new
		p "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
		p params
		p "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
	end

	def create
		@message = Message.new(message_params) 
	  	if @message.save

	    	redirect_to '/messages' 
	  	else 
	    	render 'new' 
	  	end 
	end

	def destroy
		p "========================"
		p "destroy"
		p params
		p "========================"
		@messages = Message.find(params[:id])
		@messages.destroy
		redirect_to messages_path
	end

	private 
  def message_params 
    params.require(:message).permit(:content) 
  end


end
