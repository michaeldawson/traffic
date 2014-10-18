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

      Maps.drawRoute(from, to);

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