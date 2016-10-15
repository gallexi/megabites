class NegotiationController < ApplicationController
	
	before_action :authenticate_user!
  	respond_to :html, :js

	def new
		@negotiation = Negotiation.new
	end

	def create
		@negotiation = Negotiation.new(negotiation_params)
		@negotiation.user_id = current_user.id
		@negotiation.location_id = current_user.location_id
		if @negotiation.save
      			redirect_to negotiation_path(id: @negotiation.id), :notice => "Hungry elephants are runnning your way!"
    		else
      			render "new"
    		end
	end

	def show
		@negotiation = Negotiation.find(params[:id])
		@messages = @negotiation.messages
	end

	def new_message
		@negotiation = Negotiation.find(params[:negotiation_id])
		@messages = @negotiation.messages
		@message = Message.new
		@message.body = params[:message][:body]
		@message.user_name = current_user.name
		@message.user_id = current_user.id
		@message.negotiation_id = @negotiation.id
		@message.save
		#respond_with { @message }
		respond_to do |format|
			format.js 
			format.html {""}
		end

	end


	def validate

	end

	private

	def negotiation_params
		params.require(:negotiation).permit(:order_from, :food_items, :rendezvous_point, :user_id, :customers)
	end

	def message_params
		params.require(:message).permit(:body)
	end


end
