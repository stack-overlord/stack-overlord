$(function() {
	var mash = $('#gawkward').children().attr('id');
  var faye = new Faye.Client('http://www.stackoverlord.com:9292/faye');
  faye.subscribe('/' + mash, function(data) {
  	$('#gawkward').html(data)
  })
});