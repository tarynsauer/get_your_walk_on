$(document).ready(function() {
    function getLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
        }
      else{
          $('#currentPosition').html("Sorry, geolocation isn't supported by this browser. Please enter you current address.");
        }
  
    function showPosition(position) {
      $('#location').replaceWith("<p>Hey, there! Looks like you're at latitude " + position.coords.latitude + 
      " and longitude " + position.coords.longitude + "</p>");  
      }
    }
    $(window).load(function () {
        getLocation()
    });
});
