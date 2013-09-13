var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;
var homeLatitude = $('#latitude').html();
console.log(homeLatitude);
var homeLongitude = $('#longitude').html();
console.log(homeLongitude);
var home = new google.maps.LatLng(homeLatitude,homeLongitude);
// var home = new google.maps.LatLng(41.8828773,-87.6282421);


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
  var waypoint_one = $('#waypoint_one').html();
  console.log(waypoint_one);
  var waypoint_two = $('#waypoint_two').html();
  console.log(waypoint_two);
  var waypoints = [];
            waypoints.push({
                // location: "41.8789000,-87.6358000",
                location: waypoint_one,
                stopover: false
            });
            waypoints.push({
                // location: "41.8827024,-87.6193938",
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
      var summaryPanel = document.getElementById('directions_panel');
      summaryPanel.innerHTML = '';
      // For each route, display summary information.
      for (var i = 0; i < route.legs.length; i++) {
        var routeSegment = i + 1;
        summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment + '</b><br>';
        summaryPanel.innerHTML += route.legs[i].home_address + ' to ';
        summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
        summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
      }
    }
  });

  google.maps.event.addDomListener(window, 'load', initialize);