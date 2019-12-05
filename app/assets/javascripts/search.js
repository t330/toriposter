$(document).on('turbolinks:load', function() {
  function displayResult(searchResult) {
    var html = `<li class='user_photo_list__photo'>
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
    $(".user_photo_list").append(html);
  };
  function noSearchResult(msg) {
    $(".search_result").empty();
    var html = `<div class='no_search_result'>${msg}</div>`;
    $(".user_photo_list").append(html);
  };
  $(".search_field").on("keyup", function() {
    var input = $(".search_field").val();
    function highlight() {
      $(".user_photo_list").highlight(input);
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
      $(".user_photo_list").empty();
      $(".pagination_style").empty();
      if (search.length !== 0) {
        search.forEach(function(searchResult) {
          displayResult(searchResult);
          highlight();
          $(".search_result").html(search.length + "件ヒット: " + input + " を含む検索結果を表示しています");
        });
        if (input == "") {
          $(".user_photo_list").empty();
          $(".search_result").empty();
          $(".search_result").append("( ˘⊖˘)zzz");
        };
      } else {
        noSearchResult("一致する投稿がありません");
      };
    })
    .fail(function() {
      alert("検索に失敗しました！もう一度検索してください");
    });
  });
});