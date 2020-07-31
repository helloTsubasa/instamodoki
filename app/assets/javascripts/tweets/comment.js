// $(document).on('turbolinks:load', ()=> {
//   $(function() {
//     //始めにjQueryで送信ボタンを無効化する
//     $('.comment-submit').prop("disabled", true);
    
//     //入力欄の操作時
//     $('.required').change(function () {
//       //必須項目が空かどうかフラグ
//       let flag = true;
//       //必須項目をひとつずつチェック
//       $('.required').each(function(e) {
//         //もし必須項目が空なら
//         if ($('.required').eq(e).val() === "") {
//           flag = false;
//         }
//       });
//       //全て埋まっていたら
//       if (flag) {
//         //送信ボタンを復活
//         $('.comment-submit').prop("disabled", false);
//       }
//       else {
//         //送信ボタンを閉じる
//         $('.comment-submit').prop("disabled", true);
//       }
//     });
//   });
// });