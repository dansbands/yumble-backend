class Api::V1::RequestController < ApplicationController

  def fetch_data
    offset = (Restaurant.count/50.0).ceil * 50 + 1

    resp = RestClient::Request.execute(
      method:  :get,
      url:     "https://api.yelp.com/v3/businesses/search?term=restaurant&latitude=40.705353&longitude=-74.014003&limit=50&offset=#{offset}",
      headers:
      {
        'Authorization' => "Bearer Wua9tvPsWwGGyMB-InHKZfE-ZkzjwGZu3zdtO_AwUvY-UEmT_hb774Fvd0h0W53u04Rhqt3ZqTwn-X5mip89zdh50gqcCDKvnUocoLcx3WzhIGNMd8jMKSJVuN9wWnYx",
      }
    )

    parsed_resp = JSON.parse(resp)
    businesses = parsed_resp["businesses"].map { |e|
      Restaurant.create({ restaurant_id: e["id"], name: e["name"], image_url: e["image_url"], is_closed: e["is_closed"], url: e["url"], review_count: e["review_count"], categories: e["categories"], rating: e["rating"], latitude: e["coordinates"]["latitude"], longitude: e["coordinates"]["longitude"], transactions: e["transactions"], price: e["price"], location: e["location"],  phone: e["phone"], display_address_1: e["location"]["display_address"][0], display_address_2: e["location"]["display_address"][1], display_phone: e["display_phone"], distance: e["distance"] })
    }

     render json: parsed_resp, status: 200
  end
end
