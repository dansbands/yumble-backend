class Api::V1::SavedRestaurantsController < ApplicationController
  def index
    saved_restaurants = SavedRestaurant.all
    render json: saved_restaurants, status: 200
  end

  # def show
  #   @restaurant = Restaurant.find(params[:id])
  #   render json: @restaurant, status: 200
  # end
  #
  def create
    e = params
    restaurant = SavedRestaurant.new({ user_id: 1, restaurant_id: e["id"], name: e["name"], image_url: e["image_url"], is_closed: e["is_closed"], url: e["url"], review_count: e["review_count"], categories: e["categories"], rating: e["rating"], latitude: e["coordinates"]["latitude"], longitude: e["coordinates"]["longitude"], transactions: e["transactions"], price: e["price"], location: e["location"],  phone: e["phone"], display_address_1: e["location"]["display_address"][0], display_address_2: e["location"]["display_address"][1], display_phone: e["display_phone"], distance: e["distance"] })
    # byebug
    if restaurant.save
      render json: restaurant

    else
      render json: { errors: co.errors.full_messages }, status: 422
    end
  end

end
