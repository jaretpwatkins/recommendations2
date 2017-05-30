class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all

    @restaurants = Restaurant.all.sort do |a, b|
      b.recommendations.count <=> a.recommendations.count
    end

    render("recommendations/index.html.erb")
  end

  def show
    @recommendation = Recommendation.find(params[:id])

    render("recommendations/show.html.erb")
  end

  def new
    @recommendation = Recommendation.new

    render("recommendations/new.html.erb")
  end

  def create
    @recommendation = Recommendation.new

    @recommendation.user_id = params[:user_id]
    @recommendation.restaurant_id = params[:restaurant_id]

    save_status = @recommendation.save

    if save_status == true
      redirect_to("/", :notice => "Recommendation created successfully.")
    else
      render("recommendations/new.html.erb")
    end
  end

  def edit
    @recommendation = Recommendation.find(params[:id])

    render("recommendations/edit.html.erb")
  end

  def update
    @recommendation = Recommendation.find(params[:id])

    @recommendation.user_id = params[:user_id]
    @recommendation.restaurant_id = params[:restaurant_id]

    save_status = @recommendation.save

    if save_status == true
      redirect_to("/recommendations/#{@recommendation.id}", :notice => "Recommendation updated successfully.")
    else
      render("recommendations/edit.html.erb")
    end
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])

    @recommendation.destroy

    if URI(request.referer).path == "/recommendations/#{@recommendation.id}"
      redirect_to("/", :notice => "Recommendation deleted.")
    else
      redirect_to(:back, :notice => "Recommendation deleted.")
    end
  end
end
