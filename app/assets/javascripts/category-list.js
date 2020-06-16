$(function(){
  function buildChildHTML(child){
    var html =`<a class="child_category" id="${child.id}" 
                href="/category/${child.id}">${child.name}</a>`;
    return html;
  }
  $(".parent_category").on("mouseover",function(){
    var id = this.id
    console.log(id)
    $(".child_category").remove();//一旦出ている子カテゴリ消す
    $(".grand_child_category").remove();//孫も消す

    $.ajax({
      type: 'GET',
      url: '/category/new',//newアクションに飛ばしてます
      data: {parent_id: id},//どの親の要素かを送ります　params[:parent_id]で送られる
      dataType: 'json'
    })

    
  })
});