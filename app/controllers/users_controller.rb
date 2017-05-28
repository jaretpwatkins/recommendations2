class UsersController < ApplicationController

def index

  @users = User.all

  render("/users/index.html.erb")
end

def show

@user = User.find(params[:id])

@recommendation = Recommendation.all

render("/users/show.html.erb")
end

def myrecs

render("/users/myrecs.html.erb")
end

end
