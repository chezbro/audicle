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

//= require main
//= require typekit
//= require_tree .

$(function(){
   $('h6').on('click',function(){
      $('.social').stop().slideToggle();
   });
});
//  $(function callback(stream) {
//       var context = new webkitAudioContext();
//       var mediaStreamSource = context.createMediaStreamSource(stream);
//       });
// $(function() {
//   navigator.webkitGetUserMedia({audio:true}, callback);
// });

// function callback(stream) {
//     window.AudioContext = window.AudioContext || window.webkitAudioContext;
//     var context = new AudioContext();

//     // Create an AudioNode from the stream.
//     var mediaStreamSource = context.createMediaStreamSource( stream );
//     rec = new Recorder(mediaStreamSource);
//     // Connect it to the destination to hear yourself (or any other node for processing!)
//     mediaStreamSource.connect( context.destination );
// }

// navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia;
// navigator.getUserMedia( {audio:true}, callback );

  // var ws = new WebSocket("ws://127.0.0.1:9999");
  //              ws.onopen = function () {
  //                  console.log("Openened connection to websocket");
  //              };

  //              ws.onmessage = function(e) {
  //                  var jsonResponse = jQuery.parseJSON(e.data );
  //                  console.log(jsonResponse);
  //                  if (jsonResponse.hypotheses.length > 0) {
  //                     var bestMatch = jsonResponse.hypotheses[0].utterance;
  //                      $("#outputText").text(bestMatch);
  //                  }
  //              }
