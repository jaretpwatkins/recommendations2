class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.sort do |a, b|
      b.recommendations.count <=> a.recommendations.count
    end

    render("restaurants/index.html.erb")
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    render("restaurants/show.html.erb")
  end

  def new
    @restaurant = Restaurant.new

    render("restaurants/new.html.erb")
  end

  def create
    @restaurant = Restaurant.new

    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.neighborhood_id = params[:neighborhood_id]
    @restaurant.image_url = params[:image_url]
    @restaurant.yelp_url = params[:yelp_url]

    save_status = @restaurant.save

    if save_status == true
      redirect_to("/restaurants/#{@restaurant.id}", :notice => "Restaurant created successfully.")
    else
      render("restaurants/new.html.erb")
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])

    render("restaurants/edit.html.erb")
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.neighborhood = params[:neighborhood]
    @restaurant.image_url = params[:image_url]
    @restaurant.yelp_url = params[:yelp_url]

    save_status = @restaurant.save

    if save_status == true
      redirect_to("/restaurants/#{@restaurant.id}", :notice => "Restaurant updated successfully.")
    else
      render("restaurants/edit.html.erb")
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy

    if URI(request.referer).path == "/restaurants/#{@restaurant.id}"
      redirect_to("/", :notice => "Restaurant deleted.")
    else
      redirect_to(:back, :notice => "Restaurant deleted.")
    end
  end
end
