$(function() {
	var mash = $('#gawkward').children().attr('id');
  var gawkSubscribe = new Firebase('https://blazing-fire-7163.firebaseio.com/' + mash);

  gawkSubscribe.on('child_changed', function(data) {
  $('#gawkward').html(data.val());
  });
});
