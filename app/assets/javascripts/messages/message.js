$(function(){
  function buildHTML(message){
    if( message.image ){
      let html =
        `<div class="Message-box">
          <div class="Message-box__message-info">
            <div class="Message-box__message-info__name">
              ${message.user_name}
            </div>
            <div class="Message-box__message-info__date">
              ${message.created_at}
            </div>
          </div>
          <div class="Message-box__message">
            <p class="Message-box__message__content">
              ${message.content}
            </p>
            <img class="Message-box__message__image" src=${message.image}>
          </div>
        </div>`
      return html;
    } else {
      let html =
        `<div class="Message-box">
          <div class="Message-box__message-info">
            <div class="Message-box__message-info__name">
              ${message.user_name}
            </div>
            <div class="Message-box__message-info__date">
              ${message.created_at}
            </div>
          </div>
          <div class="Message-box__message">
            <p class="Message-box__message__content">
              ${message.content}
            </p>
          </div>
        </div>`
      return html;
    };
  }
  
  $('.New-message').on('submit', function(e){
    e.preventDefault()
    let formData = new FormData(this)
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data)
      console.log(html)
    })
  })
});