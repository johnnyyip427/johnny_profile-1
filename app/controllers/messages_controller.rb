class MessagesController < ApplicationController


before_action :authorize, :only=>[:new] 


	def index
		@messages = Message.all
		#@messages = Message.where(id: (current_user.id))
		# p "========================"
		#p params
		#p current_user
		# p @messages
		# p "========================"
		# simons work
		# @messages = Message.where(id:(user.id))
	end

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

	private 
  def message_params 
    params.require(:message).permit(:content) 
  end


end
