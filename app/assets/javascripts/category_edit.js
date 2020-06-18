  $(function(){
    // optionを定義、categoryに取得した値を入れていく
    function appendOption(category){
      var html = `<option value="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子セレクトボックスのhtml作成
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
        childSelectHtml = `<div class='children_category'>
                          <select class="category_select-box" id="child_category" name="item[child_category_id]">
                          
                          ${insertHTML}
                          </select>
                          </div>`;
      $('.new-item-content__thedetails__category').append(childSelectHtml);
    }
    // 孫セレクトボックスのhtml作成
    function appendgrandChidrenBox(insertHTML){
      var grandchildrenSelectHtml = '';
      grandchildrenSelectHtml = `<div class= 'grand_category'>
                                <select class="category_select-box" id="grandchild_category" name="item[grandchild_category_id]">
                                
                                ${insertHTML} 
                                </select>
                                </div>`;
      $('.new-item-content__thedetails__category').append(grandchildrenSelectHtml);
    }
    
    // 親ボックスのタブが切り替わったら発火
    $(document).ready(function(){
      console.log("ok")
      // 親ボックスのidを取得してそのidをAjax通信でコントローラーへ送る
      var parentValue = document.getElementById("category_select").value;
      // parentValueに値を代入している
      if (parentValue != ''){
        $.ajax({
          url: '/items/search',
          type: "GET",
          data: {
            // 親ボックスの値をparent_idという変数にする。
            parent_id: parentValue 
          },
          dataType: 'json'
          //json形式を指定
        })
        .done(function(children){
          // 通信に成功した場合
          var insertHTML = '';
          children.forEach(function(child){
          // forEachでchildに一つずつデータを代入｡子のoptionが一つずつ作成される｡
          insertHTML += appendOption(child); 
        });
          // 最後に代入
          appendChidrenBox(insertHTML); 
        })
        .fail(function(){
          // 通信に失敗した場合の処理です
          alert('通信に失敗しました。')
        })
      }
    });
    
    
    $(window).on('load', function() {
      // 子ボックスのidを取得してそのidをAjax通信でコントローラーへ送る
      var childValue = document.getElementById("child_category").value;
      // childValueに値を代入
      if (childValue != ''){
        $.ajax({
          url: '/items/search_two',
          type: "GET",
          data: {
            // 子ボックスの値をchild_idという変数にする。
            child_id: childValue 
          },
          dataType: 'json'
          //json形式を指定
        })
        .done(function(grandchildren){
          // 通信に成功した場合
          console.log(grandchildren);
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
          // forEachでgrandchildに一つずつデータを代入｡孫のoptionが一つずつ作成される｡
          insertHTML += appendOption(grandchild);
        });
          // 最後に代入
          appendgrandChidrenBox(insertHTML); 
          $(document).on("change", "#child_category",function(){
            $('.grand_category').remove();
          })
        })
        .fail(function(){
          // 通信に失敗した場合の処理です
          alert('通信に失敗しました')
        })
      }
    });
  })