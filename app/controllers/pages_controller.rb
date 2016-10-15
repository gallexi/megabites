class PagesController < ApplicationController

before_filter :authenticate_user!, except: [:show]

def home
	@user = current_user
	@locations = @user.organization.locations
	@orders = @user.location.orders
	render template: "pages/home.html.erb"
end

def show
	render template: "pages/#{params[:page]}"
end

end
