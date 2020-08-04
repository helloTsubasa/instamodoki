$(function(){
  $('.New-message').on('submit', function(e){
    e.preventDefault()
    console.log("送信後、イベント発火がされている")
  })
});