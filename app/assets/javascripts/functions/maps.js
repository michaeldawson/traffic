var Maps = function() {
  return {
    init: function() {
      // Set default height to all Google Maps Containers
      $('.gmap').css('height', '600px');

      // Initialize map with markers
      var gmapIssues = new GMaps({
        div: '#gmap-issues',
        lat: -34.9,
        lng: 138.6,
        zoom: 10,
        scrollwheel: false
      })

      $.get("/issues", function(data) {
        var markers = [];
        $.each(data, function(){
          marker = $.extend(this, { animation: google.maps.Animation.DROP, infoWindow: {content: '<strong>' + this.description + ' </strong><br/>(' + this.issue_date + ')'}});
          console.log('added ' + marker.description);
          markers.push(marker);
        });
        console.log(markers);
        gmapIssues.addMarkers(markers)
      });

      // GMaps.geolocate({
      //     success: function(position) {
      //         gmapIssues.setCenter(position.coords.latitude, position.coords.longitude);
      //         gmapIssues.addMarker({
      //             lat: position.coords.latitude,
      //             lng: position.coords.longitude,
      //             animation: google.maps.Animation.DROP,
      //             title: 'GeoLocation',
      //             infoWindow: {
      //                 content: '<div class="text-success"><i class="fa fa-map-marker"></i> <strong>Your location!</strong></div>'
      //             }
      //         });
      //     },
      //     error: function(error) {
      //         alert('Geolocation failed: ' + error.message);
      //     },
      //     not_supported: function() {
      //         alert("Your browser does not support geolocation");
      //     },
      //     always: function() {
      //         // Message when geolocation succeed
      //     }
      // });
    }
  };
}();