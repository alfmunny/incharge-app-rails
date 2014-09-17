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
//= require handlebars
//= require ember
//= require ember-data
//= require moment
//= require showdown
//= require bootstrap
//= require highcharts
//= require websocket_rails/main
//= require_self
//= require ./myapp
//= require_tree .

// for more details see: http://emberjs.com/guides/application/
Myapp = Ember.Application.create();
//
// jQuery(document).ready(function() {
//   setTimeout(function() {
//     var source = new EventSource('/');
//     source.addEventListener('refresh', function(e) {
//       window.location.reload();
//     });
//   }, 1);
// });
