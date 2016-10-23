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
		@negotiation.customers = current_user.id.to_s
		if @negotiation.save
      			redirect_to negotiation_path(id: @negotiation.id), :notice => "Hungry elephants are runnning your way!"
    		else
      			render "new"
    		end
	end

	def join
		@negotiation = Negotiation.find(params[:id])
		if @negotiation.customers.nil?
			@negotiation.customers = current_user.id.to_s
		else
			@negotiation.customers += "," + current_user.id.to_s
		end
		@negotiation.save
		redirect_to negotiation_path(id: @negotiation.id), :notice => "You've joined this herd!"
	end

	def leave
		@negotiation = Negotiation.find(params[:id])
		if @negotiation.user_id == current_user.id
			if not @negotiation.customers.nil?
				c = @negotiation.customers.split(",").map{ |s| s.to_i }
				c.delete(current_user.id)
                                @negotiation.customers = c.join(",") #changed
				if not @negotiation.customers === ""  #changed
					@negotiation.user_id = c.first
					redirect_to root_path
				else
					redirect_to negotiation_path(id: @negotiation.id), :method => "delete"
				end
			else
				redirect_to negotiation_path(id: @negotiation.id), :method => "delete"
			end
		else
			if not @negotiation.customers.nil?
				c = @negotiation.customers.split(",").map{ |s| s.to_i }
				c.delete(current_user.id)
                                @negotiation.customers = c.join(",") #changed
				if not @negotiation.customers === "" #changed
					@negotiation.user_id = c.first
					redirect_to root_path
				else
					redirect_to negotiation_path(id: @negotiation.id), :method => "delete"
				end
			else
				redirect_to negotiation_path(id: @negotiation.id), :method => "delete"
			end
		end
		#redirect_to root_path, notice: "Sorry to see you leave your herd :("
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

	def destroy
		@negotiation = Negotiation.find(params[:id])
		@negotiation.destroy
		@negotiation.save
	end

	private

	def negotiation_params
		params.require(:negotiation).permit(:order_from, :food_items, :rendezvous_point, :user_id, :customers)
	end

	def message_params
		params.require(:message).permit(:body)
	end


end
