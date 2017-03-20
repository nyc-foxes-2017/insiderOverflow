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

  $(document).on('click', '.new_comment', function(event){
    event.preventDefault()
    var current = $(this)
    var url = current.attr('href')

    $.ajax({
      url: url,
      method: 'get'
    }).done(function(response){
      current.parent().find('.comments').append(response)
      current.parent().find('.new_comment').hide()
    })
  })

  $(document).on('submit','.new_comment_form', function(event){
    event.preventDefault()
    var current = $(this)
    var url = current.attr('action')
    var method = current.attr('method')
    var data = current.serialize()
    $.ajax({
      url: url,
      method: method,
      data: data
    }).done(function(response){
      current.closest('.comments').append(response)
      current.hide()
      $('.new_comment').show()
    })
  } )

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

  $(document).on('submit', '#new-answer-form', function(event){
    event.preventDefault();
    var current = $(this)
    var url = current.attr('action')
    var method = current.attr('method')
    var data = current.serialize()
    $.ajax({
      url: url,
      method: method,
      data: data
    }).done(function(response){
      $('footer').before(response)
      $(current).hide()
      $('#reply_click').show()
    })

  })

  $(document).on('submit', '.delete-button', function(event){
    event.preventDefault();
    var current = $(this)
    var url = current.attr('action')
    var method = current.attr('method')
    var data = current.serialize()

    $.ajax({
      url: url,
      method: method,
      data: data
    }).done(function(response){
      current.parent().hide()
    })

  })


});
