// $(function() {
//   let fileIndex = [1,2,3,4,5,6,7,8,9,10];
//   console.log(fileIndex)
//   $('.new-images').on('change', '.js-file', function(e) {
//     // fileIndexの先頭の数字を使ってinputを作る
//     $('.new-images').append(buildFileField(fileIndex[0]));
//     fileIndex.shift();
//     // 末尾の数に1足した数を追加する
//     fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
//   });
// })

$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][image_url]"
                    id="product_images_attributes_${index}_image"><br>
                      <span class="js-remove">削除</span>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // console.log(buildFileField)

  $('.new-images').on('change', '.js-file', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    console.log(buildFileField)
    $('.new-images').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)

  });

  $('.new-images').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('.new-images').append(buildFileField(fileIndex[0]));
  });
  // $('.new-images').on('click', function(e){
  //   e.preventDefault();
  //   console.log('hj')
  // })
});


{/* <input type="file" name="item[images_attributes][][image_url]" style="display:none" class="images-file" id="item_images_attributes_0_image"></input> */}