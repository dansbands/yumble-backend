class Api::V1::UsersController < ApplicationController
  def index
    users = User.all

    users_json = users.map do |user|
      {
        id: user.id,
        username: user.username,
        firstname: user.firstname,
        lastname: user.lastname,
        restaurants: user.restaurants.map do |r|
          {
            id: r.id,
            user_id: user.id,
            username: user.username,
            restaurant_id: r.restaurant_id,
            name: r.name,
            image_url: r.image_url,
            is_closed: r.is_closed,
            url: r.url,
            review_count: r.review_count,
            categories: r.categories,
            rating: r.rating,
            latitude: r.latitude,
            longitude: r.longitude,
            transactions: r.transactions,
            price: r.price,
            location: r.location,
            phone: r.phone,
            display_address_1: r.display_address_1,
            display_address_2: r.display_address_2,
            display_phone: r.display_phone,
            distance: r.distance
          }
        end,
        saved_restaurants: user.saved_restaurants.map do |r|
          {
            id: r.id,
            user_id: user.id,
            username: user.username,
            restaurant_id: r.restaurant_id,
            name: r.name,
            image_url: r.image_url,
            is_closed: r.is_closed,
            url: r.url,
            review_count: r.review_count,
            categories: r.categories,
            rating: r.rating,
            latitude: r.latitude,
            longitude: r.longitude,
            transactions: r.transactions,
            price: r.price,
            location: r.location,
            phone: r.phone,
            display_address_1: r.display_address_1,
            display_address_2: r.display_address_2,
            display_phone: r.display_phone,
            distance: r.distance
          }
        end
        }
    end
    render json: users_json, status: 200
  end

  def show
    user = User.find(params[:id])
    # byebug

    user_json = {
      id: user.id,
      username: user.username,
      firstname: user.firstname,
      lastname: user.lastname,
      restaurants: user.restaurants.map do |r|
        {
          id: r.id,
          user_id: user.id,
          username: user.username,
          restaurant_id: r.restaurant_id,
          name: r.name,
          image_url: r.image_url,
          is_closed: r.is_closed,
          url: r.url,
          review_count: r.review_count,
          categories: r.categories,
          rating: r.rating,
          latitude: r.latitude,
          longitude: r.longitude,
          transactions: r.transactions,
          price: r.price,
          location: r.location,
          phone: r.phone,
          display_address_1: r.display_address_1,
          display_address_2: r.display_address_2,
          display_phone: r.display_phone,
          distance: r.distance
        }
      end,
      saved_restaurants: user.saved_restaurants.map do |r|
        {
          id: r.id,
          user_id: user.id,
          username: user.username,
          restaurant_id: r.restaurant_id,
          name: r.name,
          image_url: r.image_url,
          is_closed: r.is_closed,
          url: r.url,
          review_count: r.review_count,
          categories: r.categories,
          rating: r.rating,
          latitude: r.latitude,
          longitude: r.longitude,
          transactions: r.transactions,
          price: r.price,
          location: r.location,
          phone: r.phone,
          display_address_1: r.display_address_1,
          display_address_2: r.display_address_2,
          display_phone: r.display_phone,
          distance: r.distance
        }
      end
      }
    render json: user_json, status: 200
  end

  def create
    user = User.new(firstname: params[:firstname], lastname: params[:lastname], username: params[:username], password: params[:password])
    if user.save
      render json: {id: user.id, username: user.username, user: user, token: issue_token(user)}
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end
end
