class PagesController < ApplicationController


def home
	render template: "pages/home.html.erb"
end

def show
	render template: "pages/#{params[:page]}"
end

end
