window.onload = document.addEventListener("turbolinks:load", function() {
  document.getElementById('submit').onclick = function(click) {
    const selectedPhoto = document.getElementById('selected_photo').value;
    const latitude = document.getElementById('latitude').value;
    const longitude = document.getElementById('longitude').value;
    if ((selectedPhoto == "") || (latitude == "") || (longitude == "")) {
      click.preventDefault();
      window.alert("「※」の項目で未入力のものがあります★");
    }
  };
});