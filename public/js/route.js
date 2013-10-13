$(document).ready( function() {


var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;
var homeLatitude = $('#latitude').val();
var homeLongitude = $('#longitude').val();
home = new google.maps.LatLng(homeLatitude,homeLongitude);

function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();

  var mapOptions = {
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: home
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  directionsDisplay.setMap(map);
}
  var waypoint_one = $('#waypoint_one').val();
  console.log(waypoint_one);
  var waypoint_two = $('#waypoint_two').val();
  console.log(waypoint_two);
  var waypoints = [];
            waypoints.push({
                location: waypoint_one,
                stopover: false
            });
            waypoints.push({
                location: waypoint_two,
                stopover: false
            });

  var request = {
      origin: home,
      destination: home,
      waypoints: waypoints,
      optimizeWaypoints: true,
      travelMode: google.maps.TravelMode.WALKING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
      var route = response.routes[0];
      for (var i = 0; i < route.legs.length; i++) {
        var routeSegment = i + 1;
        $('#starting_point').val(route.legs[i].end_address);
        $('#total_distance').val(route.legs[i].distance.text);
      }
    }
  });

  google.maps.event.addDomListener(window, 'load', initialize);
});