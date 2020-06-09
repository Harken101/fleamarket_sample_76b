$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file", style: "display:none"
                    name="item[images_attributes][][image_url]"
                    id="item_images_attributes_${index}_image">
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('.new-images').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent()
    // ファイルのブラウザ上でのURLを取得する
    // console.log(targetIndex)
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      // $('#image-box__container').append(buildImg(fileIndex[0], blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.new-images').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });




  $('#image-box-1').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // console.log(this)
    $('.js-file').val("")
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('.new-images').append(buildFileField(fileIndex[0]));
  });
});




