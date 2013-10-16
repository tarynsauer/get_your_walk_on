$(document).ready(function() {
  function getLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPosition, showError);
      }
    else{
        $('#currentPosition').html("Sorry, geolocation isn't supported by this browser. Please enter you current address.");
      }

  function showPosition(position) {
      $('#latitude').val(position.coords.latitude);
      $('#longitude').val(position.coords.longitude);
    }
  }
  $(window).load(function () {
    getLocation()
  });

  function showError() {
    $("#map-canvas-start").replaceWith("<p>Sorry, geolocation isn't supported by this browser. Please enter your current address.</p>");
    $("#addressSection").removeClass("invisible");
  }

});