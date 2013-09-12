#GET------------------------------------------------------------------

get '/' do
  erb :index
end

get '/map' do
  erb :map, layout: false
end

#POST------------------------------------------------------------------

post '/' do
  minutes  = params[:time]
  pace     = params[:pace]

  case pace
  when "slow"
    @distance = minutes * (1/30)
  when "moderate"
    @distance = minutes * (2.75/60)
  when "fast"
    @distance = minutes * (3.25/60)
  when "speed"
    @distance = minutes * (1/15)
  end

  # if user must enter an address
  #calculate coordinates before redirecting to 
  #map page

  redirect to '/map'
end
