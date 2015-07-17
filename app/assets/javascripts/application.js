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
//= require cookies
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $('#submit_button').on('click', function(){
    var username = prompt("Please validate username")
    var password = prompt("Please validate password")

    if (username = <%user.username%> && password = <%user.password%>)
        {alert("hey")}
      else {
        alert('what')
      }
  });

$('#new_card').on('submit', function(){
  return false
})

});