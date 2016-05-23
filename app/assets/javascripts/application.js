// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets


// listeners
function attachListeners() {
  $("#types-btn").on('click', function(){
    $('div#types').toggle("slow", function() {
      showTypes();
    });
  });
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    showMore(id);
  });
}

// shows the types of clubs
function showTypes() {
  $.get("/types.json", function(response){
    var html = '<ul">';
    var types = response.types;
    $.each(types, function(index, type){
      html += '<li><a href="/types/' + type.id + '" >' + type.name + ': with ' + type.clubs.length + ' clubs</a></li>';
    });
    html += '</ul>';
    $("div#types").html(html);
  });
}

// posts that are over 17 characters are truncated. This lets the button
// replace truncated text with full text.
function showMore(id) {
  $.get("/posts/" + id + "/post_data", function(data) {
    // Replace text of body-id div
    $("#content-" + id).html(data["content"]);
  });
}

// document ready
$(document).ready(function() {
  attachListeners();
});