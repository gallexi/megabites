class PagesController < ApplicationController

before_filter :authenticate_user!, except: [:show]
protect_from_forgery except: :update_location

def home
	@user = current_user
	@locations = @user.organization.locations
	@negotiations = @user.location.negotiations
	render template: "pages/home.html.erb"
end

def update_location
	@user = current_user
	@user.location_id = (params[:new_location]).to_i
	@user.save
	@negotiations = @user.location.negotiations
	@locations = @user.organization.locations
	respond_to do |format|
		format.js {render 'update_location'}
		format.html {redirect_to :back}
	end
	#render 'update_location.js.erb'
end

end
