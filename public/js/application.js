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
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
