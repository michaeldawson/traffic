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

      Maps.saveRoute(from, to, start_time, end_time);
    });

    $('#route-rm').click(function(){
      Maps.cleanRoute();
    })
  }
}