class PlacesController < ApplicationController
  def index
  end

  def like
    # binding.pry
    type = params[:type]
    current_user = User.find_by(:id => session[:user_id])
    @place = Place.find(params[:id])

    if type == "like"
      like = Like.new(:place => @place)
      current_user.likes << like
      render json: {place_id: @place, user_id: like.user_id} 

    elsif type == "unlike"
      like = current_user.likes.where(place: @place)
      like.destroy(like) if like
      render json: {place_id: @place}
      
    else
      # Error handling needed
      render json: {place_id: @place}
    end
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @place = Place.find params[:id]
  end

  def update
  end

  def destroy
  end
end
