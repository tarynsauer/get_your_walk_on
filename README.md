Get Your Walk On
================
This small Sinatra application uses the Google Maps API and HTML5 geolocation to randomly generate a walking path based on the user's current location. It also uses the Twitter API and Oauth user authentication.

https://getyourwalkon.herokuapp.com/

### Deployment Instructions

1. Fork and then clone the repo.

2. Install all gems:
```bash
    $ bundle install
```

3. Setup the database:
```bash
    $ rake db:create && rake db:migrate
```

4. To configure the API keys, cdit your config/application.yaml file and add the following: <br />
  a) Your Google Maps API key as GOOGLE_MAPS_API_KEY: XXXXXXX..
     Retrieve one here: https://developers.google.com/maps/signup<br /><br />
  b) Your Twitter API keys as: TWITTER_SECRET: XXXXXXX..
    and TWITTER_KEY: XXXXXXX..
     Retrieve one here: https://dev.twitter.com/apps/new

5. Good to go!
```bash
    $ shotgun
```

