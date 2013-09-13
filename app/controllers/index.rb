require 'json'

#GET------------------------------------------------------------------

get '/' do
  erb :index
end

get '/map' do
  erb :map, layout: false
end

get '/route' do
  erb :route, layout:false
end

#POST------------------------------------------------------------------

post '/' do
  p params

  minutes  = params[:time].to_f
  pace     = params[:pace]

  case pace
  when "slow"
    @distance = minutes * 4
  when "moderate"
    @distance = minutes * 3
  when "fast"
    @distance = minutes * 2
  when "speed"
    @distance = minutes * 1
  end

  # if user must enter an address
  #calculate coordinates before redirecting to
  #map page

  @latitude = params[:latitude].to_f
  @longitude = params[:longitude].to_f

  val = (0.0001 * @distance)
  p @latitude
  p @longitude

  latitude2 = @latitude + (rand(10) * val)
  longitude2 = @longitude + (rand(10) * val)

  latitude3 = @latitude - (rand(10) * val)
  longitude3 = @longitude - (rand(10) * val)

  # home         = "#{latitude}, #{longitude}"
  @waypoint_one = "#{latitude2}, #{longitude2}"
  @waypoint_two =  "#{latitude3}, #{longitude3}"
  p @waypoint_one
  p @waypoint_two
  erb :route, layout:false
end
