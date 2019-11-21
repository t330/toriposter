$(document).on('turbolinks:load', function() {
  $("#eye_close").click(function() {
    $.when(
      $(this).css("display", "none"),
      $("#eye_open").css("display", "inline"),
      $("html, body").animate({'scrollTop': 0}, 'fast')
    ).done(function() {
        $("#eye_open").css("display", "none");
        $("#eye_close").css("display", "inline");
    });
  });
});