$(function(){
  $("#charge-form").validate({
    rules: {
      "card-number": {
        required: true
      },
      "cvc-number": {
        required: true,
        number: true
      }
    },
    messages: {
      "card-number": { 
        required:"必須項目です",
        number:"有効なクレジットカード番号を入力してください。"
      },
      "cvc-number": { 
        required:"必須項目です",
        number: "有効な数字を入力してください。"
      }
    }
  });
});