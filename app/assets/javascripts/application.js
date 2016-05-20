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
  $("#types-btn").click(function(){
    showTypes();
  });
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    showMore(id);
  });
  $("#next-club").click(function() {
    var currentId = parseInt($("current-club").attr("data-id"));
    var nextId = getNextId(currentId);
    getClub(nextId);
  });
  $("#previous-club").click(function() {
    var currentId = parseInt($("#current-club").attr("data-id"));
    var prevId = getPrevId(currentId);
    getClub(prevId);
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


// club builder
function Club(id, name, description, member_number) {
  this.id = id;
  this.name = name;
  this.description = description;
  this.member_number = member_number;
}

// club prototype
Club.prototype.format = function() {
  var html = '<p>#' + this.id + ' ' + this.name + '<br>Description: ' + this.description + '<br>' + this.member_number + 'members.</p>';
  return html; 
};





// document ready
$(document).ready(function() {
  attachListeners();
});