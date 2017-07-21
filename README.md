# Portland Restaurants API
_API for restaurant information in the Portland, Or area_

## Getting Started
* Built on Ruby v2.4, Rails 5.1

* Clone the repository, start a postgres server, and run the following commands

```
$ bundle install
$ rails db:create
$ rails db:schema:load
```
* You can run ```$ rails s``` to start a development server
* Also, you can seed the database by running ```$ rails db:seed```

## Usage/Endpoints
_*All requests are based off of the local developement server_

##### Request all restaurants
request method: GET  
Note: The requests are paginated in groups of 20. To view more, append the corresponding page parameter shown below.
```
http://localhost:3000/restaurants
http://localhost:3000/restaurants?page=2
```

##### Request a restaurant via ID
request method: GET
```
http://localhost:3000/restaurants/RESTAURANT_ID
```

##### Create a restaurant (fill in the corresponding parameters)
request method: POST  
Note: All parameters are required
```
http://localhost:3000/restaurants?name=RESTAURANT_NAME&category=RESTAURANT_CATAGORY&price_range=RESTAURANT_PRICERANGE&address=RESTAURANT_ADDRESS
```

##### Edit a restaurant (fill in the corresponding parameters)
request method: PATCH  
```
http://localhost:3000/restaurants?name=RESTAURANT_NAME&category=RESTAURANT_CATAGORY&price_range=RESTAURANT_PRICERANGE&address=RESTAURANT_ADDRESS
```

##### Delete a restaurant
request method: DELETE  
```
http://localhost:3000/restaurants/RESTAURANT_ID
```

##### Request a random restaurant
request method: GET  
```
http://localhost:3000/random_restaurant
```

##### Search for a restaurant (fill in the corresponding parameters)
request method: GET  
Note: Only one parameter can be searched for. Also, searching via price_range will return all restaurants with a price range less than the input.
```
http://localhost:3000/search_restaurant?name=RESTAURANT_NAME
http://localhost:3000/search_restaurant?category=RESTAURANT_CATEGORY
http://localhost:3000/search_restaurant?price_range=RESTAURANT_PRICERANGE
```

## Further help

For further help, please contact me through github.

## License

MIT, Copyright by Tanner Eustice 2017
