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

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params) 
	  	if @message.save 


				# require 'twilio-ruby'

				# account_sid = "PUT SID HERE" # Your Account SID from www.twilio.com/console
				# auth_token = "PUT TOKEN HERE"   # Your Auth Token from www.twilio.com/console

				# @client = Twilio::REST::Client.new account_sid, auth_token
				# message = @client.messages.create(
				#     body: "Hello from Ruby",
				#     to: "+11234567890",    # Replace with your phone number
				#     from: "+19164149165")  # Replace with your Twilio number

				# puts message.sid


	    	redirect_to '/messages'
	  	else 
	    	render 'new' 
	  	end 
	end

	def destroy
		if current_user
		@messages = Message.find(params[:id])
		@messages.destroy
		redirect_to messages_path
	else
		redirect_to '/login'
	end
	end

	private 
  def message_params 
    params.require(:message).permit(:content) 
  end

end
