APP = {
  common: {
    init: function() {
      // App.init();
      pageSetup();
    }
  }
};

UTIL = {
  exec: function( controller, action ) {
    action = ( action === undefined ) ? "init" : action;
    console.log(controller + "." + action + ': ' + (controller !== "" && APP[controller] && typeof APP[controller][action] == "function" ));
    if( controller !== "" && APP[controller] && typeof APP[controller][action] == "function" ) {
      APP[controller][action]();
    }
  },
 
  init: function() {
    var body = document.body,
        controller = body.getAttribute( "data-controller" ),
        action = body.getAttribute( "data-action" );

    UTIL.exec( "common" );
    UTIL.exec( controller );
    UTIL.exec( controller, action );
    
  }
};
 
jQuery( document ).ready( UTIL.init );
jQuery(window).bind('page:change', UTIL.init );
