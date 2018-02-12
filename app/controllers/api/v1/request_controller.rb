class Api::V1::RequestController < ApplicationController
  def fetch_data
    # offset = (Restaurant.count/50.0).ceil * 50 + 1
    user = User.find_by(id: params["user"])

    if user.requests.last
      old_params = user.requests.last.params
      offset = user.requests.last.offset
    end

    new_params = ""
    radius = params["radius"].to_i
    price = params["price"].to_i
    latitude = params["latitude"].to_f
    longitude = params["longitude"].to_f
    term = "restaurant"


    if params["term"] != ""
      term = params["term"]
    end

    if term != "restaurant"
      new_params += "&term=#{term}+restaurant"
    else
      new_params += "&term=restaurant"
    end

    if radius > 0
      new_params += "&radius=#{radius}"
    end

    if price > 0
      new_params += "&price=#{price}"
    end

    if params["latitude"] != "0"
      new_params += "&latitude=#{latitude}"
    else
      new_params += "&latitude=40.705353"
    end
    #
    if params["longitude"] != "0"
      new_params += "&longitude=#{longitude}"
    else
      new_params += "&longitude=-74.014003"
    end


    #this should be user.restaurants.destroy_all with a dependent:destroy_all in the model

    if new_params != old_params
      user.restaurants.destroy_all
      offset = 0
    end

    if new_params == old_params
      offset += 50
    end


    # byebug
    resp = RestClient::Request.execute(
      method:  :get,
      url:     "https://api.yelp.com/v3/businesses/search?&limit=50&offset=#{offset}#{new_params}",
      headers:
      {
        'Authorization' => "Bearer Wua9tvPsWwGGyMB-InHKZfE-ZkzjwGZu3zdtO_AwUvY-UEmT_hb774Fvd0h0W53u04Rhqt3ZqTwn-X5mip89zdh50gqcCDKvnUocoLcx3WzhIGNMd8jMKSJVuN9wWnYx",
      }
    )

    parsed_resp = JSON.parse(resp)
    businesses = parsed_resp["businesses"].map { |e|
      Restaurant.create({
        user_id: user.id,
        yelp_id: e["id"],
        name: e["name"],
        image_url: e["image_url"],
        is_closed: e["is_closed"],
        url: e["url"],
        review_count: e["review_count"],
        categories: e["categories"],
        rating: e["rating"],
        latitude: e["coordinates"]["latitude"],
        longitude: e["coordinates"]["longitude"],
        transactions: e["transactions"],
        price: e["price"],
        location: e["location"],
        phone: e["phone"],
        display_address_1: e["location"]["display_address"][0],
        display_address_2: e["location"]["display_address"][1],
        display_phone: e["display_phone"],
        distance: e["distance"] })
    }

    if businesses.length < 50
      offset = 0
    end

    request = Request.create(params: new_params, user_id: params["user"], offset: offset)

    user_restaurants = user.restaurants

    render json: user_restaurants, status: 200
  end
end
