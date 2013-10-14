require 'json'

#GET------------------------------------------------------------------

get '/walks' do
  @walks = User.find(current_user.id).walks
  erb :'/walks/index'
end

get "/walks/show/:id" do
  @walk = Walk.find(params["id"])
  erb :'/walks/show', layout:false
end

#POST------------------------------------------------------------------

post '/walks/create' do
walk = Walk.new(user_id: params["user_id"],
                 latitude: params["latitude"].to_f,
                 longitude: params["longitude"].to_f,
                 waypoint_1: params["waypoint_one"],
                 waypoint_2: params["waypoint_two"],
                 distance: params["total_distance"],
                 starting_point: params["starting_point"])
walk.save

redirect to '/walks'
end

post '/walks/destroy' do
  walk = Walk.find(params["id"])
  walk.destroy
  redirect to '/walks'
end