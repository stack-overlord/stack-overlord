// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
// var scheme   = "ws://";
// var uri      = scheme + window.document.location.host + "/";
// var ws       = new WebSocket(uri);

//

// $(document).ready(function() {
//   function checkForError(){
//     var gawkId = $('#gawkward').children().attr('id');
//     var request = $.ajax({
//       url: '/gawks/refresh',
//       type: 'GET',
//       data: {id: gawkId}
//     });
//     request.done(function(response) {
//       $('#gawkward').html(response)
//     });
//   }
//   setInterval(function(){
//     checkForError() // this will run after every 5 seconds
//   }, 5000);
// });
//= require websocket_rails/main

