$(function(){

  function buildChildHTML(child){
    var html =`<a class="child_category" id="${child.id}" href="/categories/${child.id}">${child.name}</a>`;
    return html;
  }
  $(".parent_category").on("mouseover",function(){
    var id = this.id
    $(".child_category").remove();//一旦出ている子カテゴリ消す
    $(".grand_child_category").remove();//孫も消す

    $.ajax({
      type: 'GET',
      url: '/categories/new',//newアクションに飛ばしてます
      data: {parent_id: id},//どの親の要素かを送ります　params[:parent_id]で送られる
      dataType: 'json'
    })

    .done(function(children){ //ajaxの返り値（子カテゴリー配列）
      children.forEach(function (child) {
        var html = buildChildHTML(child) //HTML化
        console.log(html)
        $(".children_box").append(html)//リストに追加
      })
    })
    .fail(function() {
      alert('error')
    });
  })

  // 孫カテゴリーの追加の処理

  // 孫カテゴリーのHTML
  function buildGrandChildHTML(child){
    var html = `<a class="grand_child_category" id="${child.id}"
                  href="/categories/${child.id}">${child.name}</a>`;
    return html;
  }
  // 子カテゴリーの一部を触るとchild.idを取得し、ajaxでそのidをcategories_contollerに飛ばし孫カテゴリーを引き出す処理。
  $(document).on("mouseover", ".child_category", function(){
    var id = this.id
    // console.log(id)
    
    $.ajax({
      type: "GET",
      url: "/categories/new",
      data: {parent_id: id},
      dataType: "json"
    })

    .done(function(children){
      console.log("done")
      children.forEach(function(child){
        var html = buildGrandChildHTML(child);
        $(".grand_children_box").append(html);
        
      })
      $(document).on("mouseover", ".child_category", function () {
        $(".grand_child_category").remove();
      });     
    })
    .fail(function() {
      alert('error')
    });
  })

});