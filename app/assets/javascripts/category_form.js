  $(function(){
    $("#parent-form").on("change",function(){
      // 親ボックスのidを取得してそのidをAjax通信でコントローラーへ送る
      var parentValue = document.getElementById("parent-form").value;
      // ("parent-form")は親ボックスのid属性
      $.ajax({
        url: '/items/search',
        type: "GET",
        data: {
          parent_id: parentValue // 親ボックスの値をparent_idという変数にする。
        },
        dataType: 'json'
        //json形式を指定
      })
      .done(function(data){
        // 通信に成功した場合
        console.log(data);
        // $('.new-item-content__thedetails__box').append(`<p>？？？</p>`);
      })
      .fail(function(){
        // 通信に失敗した場合の処理です
        alert('検索に失敗しました') // alertで検索失敗の旨を表示します
        console.log("ajax通信に失敗しました");
      })
    })
  })