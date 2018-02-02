# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# e = {"id"=>"suspenders-new-york", "name"=>"Suspenders", "image_url"=>"https://s3-media1.fl.yelpcdn.com/bphoto/AHPwnlgaqSoMsaANR1Vqtw/o.jpg", "is_closed"=>false, "url"=>"https://www.yelp.com/biz/suspenders-new-york?adjust_creative=B2UjX9sy5W5yDEUu8hqvOA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=B2UjX9sy5W5yDEUu8hqvOA", "review_count"=>141, "categories"=>[{"alias"=>"gastropubs", "title"=>"Gastropubs"}, {"alias"=>"comfortfood", "title"=>"Comfort Food"}], "rating"=>4.0, "coordinates"=>{"latitude"=>40.7086033564233, "longitude"=>-74.0135990828276}, "transactions"=>[], "price"=>"$$", "location"=>{"address1"=>"108 Greenwich St", "address2"=>"", "address3"=>"", "city"=>"New York", "zip_code"=>"10006", "country"=>"US", "state"=>"NY", "display_address"=>["108 Greenwich St", "New York, NY 10006"]}, "phone"=>"+12127325005", "display_phone"=>"(212) 732-5005", "distance"=>363.02285069054795}


user = User.create(firstname: 'Dan', lastname: 'ODea', username: 'dansbands', password_digest: '123', location: 'New York', latitude: 40.705353, longitude: -74.014003, photo_url: '')

# restaurant = Restaurant.create({"restaurant_id": "lukes-lobster-fidi-new-york", "name": "Luke's Lobster FiDi", "image_url": "https://s3-media2.fl.yelpcdn.com/bphoto/C5NV5lfsLo2nJDkx3Or9ig/o.jpg", "is_closed": false, "url": "https://www.yelp.com/biz/lukes-lobster-fidi-new-york?adjust_creative=B2UjX9sy5W5yDEUu8hqvOA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=B2UjX9sy5W5yDEUu8hqvOA", "review_count": 890, "categories": [{"alias": "seafood", "title": "Seafood"}], "rating": 4.5, "coordinates": {"latitude": 40.7046213003984, "longitude": -74.0107793876969}, "transactions": ["delivery", "pickup"], "price": "$$", "location": {"address1": "26 S William St", "address2": "", "address3": "", "city": "New York", "zip_code": "10004", "country": "US", "state": "NY", "display_address": ["26 S William St", "New York, NY 10004"]}, "phone": "+12127471700", "display_phone": "(212) 747-1700", "distance": 283.651154941696})

# Restaurant.create({ restaurant_id: e["id"], name: e["name"], image_url: e["image_url"], is_closed: e["is_closed"], url: e["url"], review_count: e["review_count"], categories: e["categories"], rating: e["rating"], coordinates: e["coordinates"], transactions: e["transactions"], price: e["price"], location: e["location"], display_address: e["display_address"], phone: e["phone"], display_phone: e["display_phone"], distance: e["distance"] })

# SavedRestaurant.create({ user_id: 1, restaurant_id: e["id"], name: e["name"], image_url: e["image_url"], is_closed: e["is_closed"], url: e["url"], review_count: e["review_count"], categories: e["categories"], rating: e["rating"], latitude: e["coordinates"]["latitude"], longitude: e["coordinates"]["longitude"], transactions: e["transactions"], price: e["price"], location: e["location"],  phone: e["phone"], display_address_1: e["location"]["display_address"][0], display_address_2: e["location"]["display_address"][1], display_phone: e["display_phone"], distance: e["distance"] })
