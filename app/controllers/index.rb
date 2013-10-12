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

  @latitude = params[:latitude].to_f
  @longitude = params[:longitude].to_f

  val = (0.00007 * @distance)

  latitude2 = @latitude + (rand(4) * val)
  longitude2 = @longitude + (rand(4) * val)

  latitude3 = @latitude - (rand(4) * val)
  longitude3 = @longitude - (rand(4) * val)

  # home         = "#{latitude}, #{longitude}"
  @waypoint_one = "#{latitude2}, #{longitude2}"
  @waypoint_two =  "#{latitude3}, #{longitude3}"

  erb :route, layout:false
end
