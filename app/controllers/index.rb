require 'json'

#GET------------------------------------------------------------------

get '/' do
  erb :index
end

get '/auth' do
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])

  @user = User.create(username: @access_token.params[:screen_name], oauth_token: @access_token.token, oauth_secret: @access_token.secret)
  session[:user_id] = @user.id
  session.delete(:request_token)
# at this point in the code is where you'll need to create your user account and store the access token
  @client = Twitter::Client.new(
     oauth_token: User.find(session[:user_id]).oauth_token,
     oauth_token_secret: User.find(session[:user_id]).oauth_secret
     )
  timeline = @client.user_timeline.first
  session[:username] = timeline[:user][:name]
  session[:profile_image_url] = timeline[:user][:profile_image_url]
erb :index

end

get '/sign_in' do
  redirect request_token.authorize_url
end

get '/sign_out' do
  session.clear
  redirect '/'
end

get '/map' do
  erb :map
end

get '/route' do
  erb :route
end

#POST------------------------------------------------------------------

post '/' do
  @client = Twitter::Client.new(
       oauth_token: User.find(session[:user_id]).oauth_token,
       oauth_token_secret: User.find(session[:user_id]).oauth_secret
       )
  @client.update(params[:tweet])
end

post '/route' do

  minutes  = params[:time].to_f
  pace     = params[:pace]

  case pace
  when "slow"
    @distance = minutes * 1
  when "moderate"
    @distance = minutes * 2
  when "fast"
    @distance = minutes * 3
  when "speed"
    @distance = minutes * 4
  end

  # if user must enter an address
  # calculate coordinates before redirecting to
  # map page

  # if params["address"]
  #   walk = Walk.new(address: params["address"])
  #   @latitude  = walk.latitude
  #   @longitude = walk.longitude
  # else
    @latitude  = params[:latitude].to_f
    @longitude = params[:longitude].to_f
  # end

  val = (0.00007 * @distance)

  latitude2 = @latitude + (rand(4) * val)
  longitude2 = @longitude + (rand(4) * val)

  latitude3 = @latitude - (rand(4) * val)
  longitude3 = @longitude - (rand(4) * val)

  @waypoint_one = "#{latitude2}, #{longitude2}"
  @waypoint_two =  "#{latitude3}, #{longitude3}"

  erb :route, layout:false
end