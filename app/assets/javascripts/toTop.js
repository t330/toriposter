$(document).on('turbolinks:load', function() {
  $("#to_top").click(function() {
    $("html, body").animate({'scrollTop': 0}, 'fast');
  });
});