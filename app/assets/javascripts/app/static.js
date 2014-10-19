APP.static = {
  index: function() {
    Maps.init();
    
  },

  welcome: function() {
    Maps.init();

    var currentdate = new Date(); 
    $('#route-starttime').val('5:00:00pm');
    $('#route-endtime').val('6:00:00pm');

    $('#route-add').click(function(){
      var to = $('#route-to').val();
      var from = $('#route-from').val();
      var start_time = $('#route-starttime').val();
      var end_time = $('#route-endtime').val();

      Maps.drawRoute(from, to);

      data = {
        route: {
          route_from: from,
          route_to: to,
          start_time: start_time,
          end_time: end_time
        }
      }

      // $.post({
      //   '/routes',
      //   data,
      //   success: function() {}
      // })

      $.post( "routes", data, function( data ) {
        $( ".result" ).html( data );
      });

      $('#route-to').val('');
      $('#route-from').val('');
      $('#route-starttime').val('5:00:00pm');
      $('#route-endtime').val('6:00:00pm');
    });

    $('#route-rm').click(function(){
      Maps.cleanRoute();
    })
  }
}