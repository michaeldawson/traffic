APP.static = {
  index: function() {
    Maps.init();
    
  },

  welcome: function() {
    Maps.init();

    $('#route-add').click(function(){
      var to = $('#route-to').val();
      var from = $('#route-from').val();

      Maps.drawRoute(from, to);

      $('#route-to').val();
      $('#route-from').val();
    });

    $('#route-rm').click(function(){
      Maps.cleanRoute();
    })
  }
}