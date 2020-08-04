$(function(){
  $(".SettingGroupForm__input").on("keyup", function() {
    let input = $(".SettingGroupForm__input").val();    //フォームの値を取得して変数に代入する
    $.ajax({
      type: 'GET';
      url: '/users';
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(users) {
      console.log("成功です");
    })
    .fail(function() {
      console.log("失敗です");
    });
  });
});