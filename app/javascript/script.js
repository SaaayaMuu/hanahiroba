/* global $*/





//スライドショー
$(document).ready(function () {
  $(".theTarget").skippr({
    // スライドショーの変化 ("fade" or "slide")
    transition : 'fade',
    // 変化に係る時間(ミリ秒)
    speed : 1000,
    // easingの種類
    navType : 'false',
    // 子要素の種類('div' or 'img')
    childrenElementType : 'div',
    // ナビゲーション矢印の表示(trueで表示)
    arrows : false,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : true,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 2000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : true,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
  });
});


/*ハンバーガーメニューpublic*/
// $(document).ready(function () {
//   $('.public-menu-trigger').on('click', function(event) {
//     $(this).toggleClass('active');
//     $('#public-sp-menu').fadeToggle();
//     event.preventDefault();
//   });
// });


/*ハンバーガーメニューtop*/
$(document).ready(function () {
  $('.menu-trigger').on('click', function(event) {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    event.preventDefault();
  });
});




/*プレビュー*/

window.onload = function(){

    //Check File API support
    if(window.File && window.FileList && window.FileReader)
    {
        var filesInput = document.getElementById("design_images");

        filesInput.addEventListener("change", function(event){

            var files = event.target.files; //FileList object
            var output = document.getElementById("result");

            for(var i = 0; i< files.length; i++)
            {
                var file = files[i];

                //Only pics
                if(!file.type.match('image'))
                  continue;

                var picReader = new FileReader();

                picReader.addEventListener("load",function(event){

                    var picFile = event.target;

                    var div = document.createElement("div");

                    div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
                            "title='" + picFile.name + "'/>";

                    output.insertBefore(div,null);

                });

                 //Read the image
                picReader.readAsDataURL(file);
            }

        });
    }
    else
    {
        console.log("Your browser does not support File API");
    }
}

// ローディング画面
$(window).on('load',function(){
  $("#splash").delay(1500).fadeOut('slow');//ローディング画面を1.5秒（1500ms）待機してからフェードアウト
  $("#splash_logo").delay(1500).fadeOut('slow');//ロゴを1.2秒（1200ms）待機してからフェードアウト
});




////*designs#show*///

$(function () {
  var $slider6 = $('#js-slider-6');

  /*--- 連動サムネイル（ドット）設定 -----------------------*/
  // スライダー初期化時
  $slider6.on('init', function (event, slick, currentSlide, nextSlide) {
    // スライドアイテム取得
    slideItem = $('#js-slider-6 .slick-slide');
    // スライドの数だけループ
    for (var i = 0; i < slick.slideCount; i++) {
      // ループ回数をキーにn番目のスライドを取得
      var slideImg = slideItem.filter(function () {
        return $(this).data('slick-index') === i;
      }).find('img').clone();
      // n番目のドットを取得
      var dot = $('.thumbs_list').find("li").eq(i);
      // n番目のスライド画像のURLを取得
      var src = slideImg.attr('src');
      // n番目のドットにn番目のスライド画像を背景に当て込み
      dot.css('background', "url(".concat(src, ")"));
      // 背景の表示の仕方を指定
      dot.css('background-size', 'cover');
    }
  });
});

// designs#showのslick 参考URL(https://and-ha.com/coding/slick/)
$(document).ready(function () {
  $slider6.slick({
    arrows: false, // 前・次のボタンを表示しない
    dots: true, // ドットナビゲーションを表示する
    dotsClass: 'thumbs_list', // ドットのクラス名を変更
    appendDots: $('.thumbs_dots'), // ドットの生成位置を変更
    customPaging: function (slick, index) { // ドットの中身を空にする
      return '';
    },
    fade: true, // スライド切り替えをフェード
    autoplay: false, //自動再生させない
    slidesToShow: 1, // 表示させるスライド数
  });
});


/*designs#index*/
// $(document).ready(function(){
//   $('.regular').slick({
//     fade: true,
//     autoplay: false, //自動再生
//     dots: false,
//     arrows: false,
//   });
// });







