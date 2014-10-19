var Maps = function() {
  var map;
  var errorTimeout;

  return {
    init: function() {
      // Set default height to all Google Maps Containers
      $('.gmap').css('height', $(window).height() + 'px');

      // Initialize map with markers
      map = new GMaps({
        div: '#gmap-issues',
        lat: -34.9,
        lng: 138.6,
        zoom: 12,
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

    saveRoute: function(origin, destination, start_time, end_time) {
      console.log ('in save route');

      errorTimeout = setTimeout(function(){
        var message = "<h4>Sorry, that didn't work!</h4> <p>Can you check the addresses and try again?</p>"
        $.bootstrapGrowl(message, {
            type: 'danger',
            delay: 7500,
            allow_dismiss: true
        });
      }, 3000);

      map.getRoutes({
        origin: origin, 
        destination: destination, 

        callback: function(data){
          clearTimeout(errorTimeout);
          var res = map.drawRoute({
            origin: origin,
            destination: destination,
            travelMode: 'driving',
            strokeColor: '#131540',
            strokeOpacity: 0.9,
            strokeWeight: 8
          });

          data = {
            route: {
              route_from: origin,
              route_to: destination,
              start_time: start_time,
              end_time: end_time
            }
          }

          $.post( "routes", data, function( data ) {
            $( ".result" ).html( data );
          });

          var message = "<h4>That was a success!</h4> <p>We've saved your travel route and will alert you if we hear of issues along the way!</p>"
          $.bootstrapGrowl(message, {
              type: 'success',
              delay: 7500,
              allow_dismiss: true
          });

          $('#route-to').val('');
          $('#route-from').val('');
          $('#route-starttime').val('5:00:00pm');
          $('#route-endtime').val('6:00:00pm');


        }
      })
    },

    cleanRoute: function() {
      map.cleanRoute();
    }
  };
}();
