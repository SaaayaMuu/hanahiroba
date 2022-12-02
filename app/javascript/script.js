


/* global $*/


// ローディング画面 viewページに記述
// $(window).on('load',function(){
//   $("#splash").delay(1500).fadeOut('slow');//ローディング画面を1.5秒（1500ms）待機してからフェードアウト
//   $("#splash_logo").delay(1500).fadeOut('slow');//ロゴを1.2秒（1200ms）待機してからフェードアウト
// });




/*top画面スライドショー viewページに記述*/
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
$(document).ready(function () {
  $('.public-menu-trigger').on('click', function(event) {
    $(this).toggleClass('active');
    $('#public-sp-menu').fadeToggle();
    event.preventDefault();
  });
});


/*ハンバーガーメニューtop　viewページに記述*/
$(document).ready(function () {
  $('.menu-trigger').on('click', function(event) {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    event.preventDefault();
  });
});




/*プレビュー*/

/*ctrl押しながら選択OK　ひとつづつwクリック×　ctrlとwクリック×*/
// function previewFile(file) {
//   // プレビュー画像を追加する要素
//   const preview = document.getElementById('result');

//   // FileReaderオブジェクトを作成
//   const reader = new FileReader();

//   // ファイルが読み込まれたときに実行する
//   reader.onload = function (e) {
//     const imageUrl = e.target.result; // 画像のURLはevent.target.resultで呼び出せる
//     const img = document.createElement("img"); // img要素を作成
//     img.src = imageUrl; // 画像のURLをimg要素にセット
//     preview.appendChild(img); // #previewの中に追加
//   }

//   // いざファイルを読み込む
//   reader.readAsDataURL(file);
// }


// // <input>でファイルが選択されたときの処理
// const fileInput = document.getElementById('design=images');
// const handleFileSelect = () => {
//   const files = fileInput.files;
//   for (let i = 0; i < files.length; i++) {
//     previewFile(files[i]);
//   }
// }
// fileInput.addEventListener('change', handleFileSelect);



/*admin/designs#new*/
/*ctrl押しながら選択OK　ひとつづつwクリック×　ctrlとwクリック×*/
window.onload = function() {

    if(document.getElementById("design_images") != null) {

        //File APIに対応しているか確認(File API＝ファイルの読み取りを行うAPI)
        if(window.File && window.FileList && window.FileReader) {
            var filesInput = document.getElementById("design_images");

            // 対象の要素.addEventListener(イベント種類, function() {
            // イベント種類＝change(フォーム部品の状態が変更されたとき)
            filesInput.addEventListener("change", function(event){

                // event.target.files＝ファイル情報を読み込む
                var files = event.target.files; //FileList object
                var output = document.getElementById("result");

                // ファイル情報の数を取得
                for(var i = 0; i< files.length; i++) {
                    var file = files[i];

                    // 画像ファイル以外は処理を止める
                    if(!file.type.match('image'))
                      continue;

                    // FileReader＝ファイルの読み取りを行う非同期API
                    var picReader = new FileReader();

                    // 対象の要素.addEventListener(イベント種類, function() {
                    // イベント種類＝load(Webページの読み込みが完了したとき(画像などのリソースすべて含む))
                    picReader.addEventListener("load",function(event) {

                        var picFile = event.target;

                        // div要素を作成
                        var div = document.createElement("div");

                        div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
                                "title='" + picFile.name + "'/>";

                        //insertBefore＝希望の位置に要素を追加できる
                        //親要素のoutputの最後の子要素としてdiv要素を追加
                        output.insertBefore(div,null);

                    });

                    // ↓画像読み込みを実行。"FileReader"の"readAsDataURL"関数を使う
                    // 引数はユーザーが入力したファイルのオブジェクト(121行目　file = files[i];）
                    picReader.readAsDataURL(file);
                }

            });
        }
        else
        {
            console.log("このブラウザはFile APIに対応していません");
        }
    }
}



/*designs#index*/
$(document).ready(function(){
    if ($('.regular')) {
      $('.regular').slick({
        fade: true,
        autoplay: true, //自動再生
        dots: false,
        arrows: false,
      });
    }
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
    var slider6 = $('#js-slider-6');
    if (slider6) {
        slider6.slick({
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
    }
});

