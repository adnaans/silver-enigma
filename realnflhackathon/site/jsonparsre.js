

var script = document.createElement('script');
script.src = 'http://code.jquery.com/jquery-1.11.0.min.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);

var myFirebaseRef = new Firebase("https://nflhackathonthingy.firebaseio.com/");


int filenumber = 0;

myFirebaseRef.child("file").on("value", function(snapshot){
	myFirebaseRef.child("json").on("value", function(snapshot){
		$.getJSON( "/Users/Downloads/game1plays/" + filenumber + ".json", function( data ) {
   			var items = [];
       			$.each( data, function( key, val ) {
       			items.push( "<li id='" + key + "'>" + val + "</li>" );
   			});
   			$( "<ul/>", {
   			"class": "my-new-list",
       		html: items.join( "" )
   			}).appendTo( "body" );
		});
	}
}