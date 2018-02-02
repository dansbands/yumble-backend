class Api::V1::RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.all
    render json: restaurants, status: 200
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    render json: @restaurant, status: 200
  end

  def create
    restaurant = Restauarant.create(params[:name])
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    render json: { message: "Successfully Deleted #{@restaurant.id}"}
  end

end
