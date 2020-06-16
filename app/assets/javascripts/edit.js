$(document).on('turbolinks:load',function(){
  // 商品編集エラーメッセージ表示
  $(".new_user").validate({
      
      rules: {
          "authenticity_token": { required: true},
          "item[name]": { required: true},
          "item[description]": { required: true},
          "item[category_id]": {required:true},
          "item[status]": { required: true},
          "item[payer]":{ required: true},
          "item[prefecture_id]":{ required: true},
          "item[preday]":{ required: true},
          "item[price]":{ required: true}

          
          
      },
      messages: {
          "authenticity_token": { required: "画像がありません"},
          "item[name]": {required: "入力してください"},
          "item[description]": { required: "入力してください"},
          "item[category_id]": {required: "選択してください"},
          "item[status]": { required: "選択してください"},
          "item[payer]": {required: "選択してください"},
          "item[prefecture_id]":{ required: "選択してください"},
          "item[preday]":{ required: "選択してください"},
          "item[price]":{ required:"入力してください"}
      }
  });
});