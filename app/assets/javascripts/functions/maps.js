var Maps = function() {
  var map;

  return {
    init: function() {
      // Set default height to all Google Maps Containers
      $('.gmap').css('height', $(window).height() + 'px');

      // Initialize map with markers
      map = new GMaps({
        div: '#gmap-issues',
        lat: -34.9,
        lng: 138.6,
        zoom: 10,
        scrollwheel: false,
        mapTypeId : google.maps.MapTypeId.ROADMAP
      })

      $.get("/issues", function(data) {
        var markers = [];
        $.each(data, function(){
          marker = $.extend(this, { animation: google.maps.Animation.DROP, infoWindow: {content: '<strong>' + this.description + ' </strong><br/>(' + this.issue_date + ')'}});
          console.log('added ' + marker.description);
          markers.push(marker);
        });
        console.log(markers);
        map.addMarkers(markers)
      });
    },

    drawRoute: function(origin, destination) {
      var res = map.drawRoute({
        origin: origin,
        destination: destination,
        travelMode: 'driving',
        strokeColor: '#131540',
        strokeOpacity: 0.9,
        strokeWeight: 8
      });
      return res;
    },

    cleanRoute: function() {
      map.cleanRoute();
    }
  };
}();
