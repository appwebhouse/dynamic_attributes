// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require_tree .

$(document).on('click', 'a.new-property', function(e) {
  e.preventDefault();
  var fields = $(this).data('fields');
  var index = $(this).data('next-index');

  $('.properties').append(fields.replace(/PROPERTY_INDEX/g, index));
  $(this).data('next-index', index + 1)
});

$(document).on('click', 'a.remove-property', function(e) {
  e.preventDefault();
  $(this).parent().remove();
});
