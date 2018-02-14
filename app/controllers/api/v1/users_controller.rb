class Api::V1::UsersController < ApplicationController
  def index
    users = User.all

    users_json = users.map do |user|
      {
        id: user.id,
        username: user.username,
        firstname: user.firstname,
        lastname: user.lastname,
        photo_url: user.photo_url,
        location: user.location,
        current_friend: user.current_friend,
        restaurants: user.restaurants.map do |r|
          {
            id: r.id,
            user_id: user.id,
            username: user.username,
            yelp_id: r.yelp_id,
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
            user_photo_url: user.photo_url,
            restaurant_id: r.restaurant_id,
            yelp_id: r.yelp_id,
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
      photo_url: user.photo_url,
      location: user.location,
      current_friend: user.current_friend,
      restaurants: user.restaurants.map do |r|
        {
          id: r.id,
          user_id: user.id,
          username: user.username,
          yelp_id: r.yelp_id,
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
          yelp_id: r.yelp_id,
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
          distance: r.distance,
          other_users: r.other_users
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

  def update
    user = User.find_by(id: params["id"])


    if user && user.update(user_params)
      render json: user, status: 200
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  private

  def user_params
    params.permit(:firstname, :lastname, :username, :password, :location, :photo_url, :current_friend)
  end
end
