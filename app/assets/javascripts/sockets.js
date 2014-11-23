$(function() {
	var mash = $('#gawkward').children().attr('id');
  var faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe('/' + mash, function(data) {
  	$('#gawkward').html(data)
  })
});