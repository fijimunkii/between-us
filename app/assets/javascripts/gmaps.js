/// GEOCODE
// geocode(request:GeocoderRequest, callback:function(Array.<GeocoderResult>, GeocoderStatus))
// https://developers.google.com/maps/documentation/javascript/3.exp/reference#GeocoderRequest
//
/// RESPONSES
// ERROR There was a problem contacting the Google servers.
// INVALID_REQUEST This GeocoderRequest was invalid.
// OK  The response contains a valid GeocoderResponse.
// OVER_QUERY_LIMIT  The webpage has gone over the requests limit in too short a period of time.
// REQUEST_DENIED  The webpage is not allowed to use the geocoder.
// UNKNOWN_ERROR A geocoding request could not be processed due to a server error. The request may succeed if you try again.
// ZERO_RESULTS  No result was found for this GeocoderRequest.
//
/// Geocoder Gem has .geographic_center method
//
/// Google Maps has GEOMETRIC_CENTER type of return location


// // Each method on the input class to geocode and store inputs to var latlong

// var ltlng = []

// geocoder.geocode({ 'address': address }, function (results, status) {
//     if (status == google.maps.GeocoderStatus.OK) {
//         map.setCenter(results[0].geometry.location);
//         var marker = new google.maps.Marker({
//             map: map,
//             position: results[0].geometry.location
//         });

//     }
//     else {
//         alert("Geocode was not successful for the following reason: " + status);
//     }
// });


// ltlng.push(new google.maps.LatLng(17.22, 78.28));
// ltlng.push(new google.maps.LatLng(13.5, 79.2));
// ltlng.push(new google.maps.LatLng(15.24, 77.16));


// //////////////////////
// // Extend bounds of map for each ltlng
// /////////

//  var bounds = new google.maps.LatLngBounds();

// for (i = 0; i < locations.length; i++) {
//   bound.extend( new google.maps.LatLng(locations[i][1], locations[i][2]) );

//   // OTHER CODE ( Tooltips and stuff for each marker)
// }

//   // Geocode center
// console.log( bound.getCenter() );




// //////////////////////

// function markicons() {
//    InitializeMap();


//         /// get geographic center and update function
//         map.setCenter(ltlng[0]);

//         /// Set markers!
//         for (var i = 0; i <= ltlng.length; i++) {
//             marker = new google.maps.Marker({
//                 map: map,
//                 position: ltlng[i]
//             });

//             (function (i, marker) {
//                 /// Info window on marker click
//                 google.maps.event.addListener(marker, 'click', function () {

//                     if (!infowindow) {
//                         infowindow = new google.maps.InfoWindow();
//                     }

//                     infowindow.setContent("Message" + i);

//                     infowindow.open(map, marker);

//                 });

//             })(i, marker);

//         }
// }


// //////////////////////////////////
// // Initialize map with browser location

// var browserSupportFlag =  new Boolean();
// var map;
// var usa = new google.maps.LatLng(44.58, -95.46); //middle of the US w 50 states

// function initialize() {
//     var myOptions = {
//     zoom: 4,
//     mapTypeId: google.maps.MapTypeId.ROADMAP
//   };
//   map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)
//   map.setCenter(usa);
// }


// /// USE BROWSER GEOLOCATION TO GET INITIAL LATLONG
// // FILL IN INPUT WITH TRANSLATION

// if(navigator.geolocation) {
//     browserSupportFlag = true;
//     navigator.geolocation.getCurrentPosition(function(position) {
//     initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
//     map.setCenter(initialLocation);
//     addMarker(initialLocation);
//   }, function() {
//   handleNoGeolocation(browserSupportFlag);
//   });
// } else {
//   browserSupportFlag = false;
//   handleNoGeolocation(browserSupportFlag);
// }

// function handleNoGeolocation(errorFlag) {
//     if (errorFlag == true) {
//         alert("Geolocation service failed.");
//         initialLocation = newyork;
//     } else {
//          alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
//          initialLocation = siberia;
//     }
//     map.setCenter(usa);
// }


// // function reloadMap(){
// //   MapOptions = {
// //     center: // RUBY GEOCODE CENTER,
// //   }

// //   Markers = {
// //     pos1: // RUBY POSITION 1
// //     pos2: // RUBY POS 2
// //     // etc..
// //     // Not even sure if this is proper
// //     //
//     // setAnimation BOUNCE
//   }

//   center =

//   Map($('.mapdiv'), opts?:MapOptions)

// }


//// Directions to location
// Courtesy of Google Maps
// https://developers.google.com/maps/documentation/javascript/3.exp/reference#DirectionsService


/// Travel Mode
// BICYCLING Specifies a bicycling directions request.
// DRIVING Specifies a driving directions request.
// TRANSIT Specifies a transit directions request.
// WALKING Specifies a walking directions request.

