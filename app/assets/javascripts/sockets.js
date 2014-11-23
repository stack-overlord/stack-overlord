$(function() {
	var mash = $('#gawkward').children().attr('id');
<<<<<<< HEAD
  var faye = new Faye.Client('http://localhost:9292/faye');
=======
  var faye = new Faye.Client('https://afternoon-reef-8266.herokuapp.com/faye');
>>>>>>> changed faye url
  faye.subscribe('/' + mash, function(data) {
  	$('#gawkward').html(data)
  })
});
