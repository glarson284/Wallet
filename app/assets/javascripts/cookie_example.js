//when the user submits their name, set a cookie with that value 
//Then, when they revisit the page, display their name in 
//the greeting div

$(document).ready(function() {

  if (Cookies.get('name')) {
    var name = Cookies.get('name');
    $('#greeting').html(name);
  }

  $('#cookie-name').on('submit', function() {
    var name = $('#cookie-name input[name=name]').val()
    Cookies.set('name', name);
  });

  if (Cookies.get('name')){
    $('.cookie').fadeOut(3000).animate({'font-size': '30px'}).fadeIn(2000)
  }
  if (Cookies.get('visited') !== 'true') {
    $('#greeting').animate({'background-color': 'red'})
  }
});