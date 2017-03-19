$(document).ready(function() {
  $('.question-container').on('click','.question-link a ', function(event){
    event.preventDefault();
    var action = $(this).attr('href')
    $.ajax({
      url: action,
      method: "get"
    }).done(function(response){
      $(".question-container").append(response)
    })
  })

  $('.question-container').on('submit', 'form', function(event){
    event.preventDefault();
    var form = $(this)
    var action = $(this).attr('action')
    var method = $(this).attr('method')
    var data = $(this).serialize()
    $.ajax({
      url: action,
      method: method,
      data: data
    }).done(function(response){
      form.hide()
      $('.all-questions').append(response)

    })
  })

  $('#response').on('click', '#reply_click', function(event){
    event.preventDefault();
    var $url = $(this).attr('href')
    $.ajax({
      url: $url
    }).done(function(response){
      $("#response").append(response)
      $('#reply_click').hide()
    })

  })

  $('.answer-container').on('submit', '#new-answer-form', function(event){
    event.preventDefault();

  })

});
