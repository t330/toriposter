$(document).on('turbolinks:load', function() {
  function displayResult(searchResult) {
    var html = `<li class='photo_list__photo'>
                  <ul>
                    <li class='adjustment'>
                      <a href='/posts/${searchResult.id}'>
                        <img src='${searchResult.photo}' alt='${searchResult.name}'>
                      </a>
                    </li>
                    <li>
                      名前:
                      <span>
                        ${searchResult.name}
                      </span>
                    </li>
                    <li>
                      撮影場所:
                      <span>
                        ${searchResult.location}
                      </span>
                    </li>
                    <li>
                      撮影日:
                      <span>
                        ${searchResult.date}
                      </span>
                    </li>
                  </ul>
                </li>`;
    $(".photo_list").append(html);
  };
  function noSearchResult(msg) {
    var html = `<div class='no_search_result'>${msg}</div>`;
    $(".photo_list").append(html);
  };
  $(".search_field").on("keyup", function() {
    var input = $(".search_field").val();
    function highlight() {
      $(".photo_list").highlight(input);
    };
    $(function() {
      var words = [];
      gon.bird_list.forEach(function(bird) {
        words.push(bird.attributes.name);
      });
      $(".search_field").autocomplete({
        source: words
      });
    });
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(search) {
      $(".photo_list").empty();
      if (search.length !== 0) {
        search.forEach(function(searchResult) {
          displayResult(searchResult);
          highlight();
        });
      } else {
        noSearchResult("一致する投稿がありません");
      };
    })
    .fail(function() {
      alert("検索に失敗しました！もう一度検索してください");
    });
  });
});
