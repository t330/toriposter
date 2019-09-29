var re = /\/posts\/new/;
var checkURL = window.location.href;
if (checkURL.match(re)) {
  var geocoder;
    var map;
    function initialize() {
      geocoder = new google.maps.Geocoder();
      var latlng = new google.maps.LatLng(-34.397, 150.644);
      var mapOptions = {
        zoom: 10,
        center: latlng
      }
      map = new google.maps.Map(document.getElementById('map'), mapOptions);
    }

    function codeAddress() {
      var address = document.getElementById('address').value;
      geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == 'OK') {
          map.setCenter(results[0].geometry.location);
          var marker = new google.maps.Marker({
              map: map,
              position: results[0].geometry.location
          });
          document.getElementById('aaa').value = results[0].geometry.location.lat();
          document.getElementById('bbb').value = results[0].geometry.location.lng();
          console.log(document.getElementById('aaa').value);
          console.log(document.getElementById('bbb').value);
        } else {
          alert('Geocode was not successful for the following reason: ' + status);
        }
      });
    }
};