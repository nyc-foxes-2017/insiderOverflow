$(document).ready(function() {
  $(document).on('submit', 'form.upform', function(event){
    event.preventDefault()
    var current = $(this)
    var url = current.attr('action')
    var method = current.attr('method')
    var data = current.serialize()
    $.ajax({
      url: url,
      method: method,
      data: data
    })
    .done(function(response){
      current.parent().find('p.votes').html('votes: ' + response)
    })
  })

  $(document).on('submit', 'form.downform', function(event){
    event.preventDefault()
    var current = $(this)
    var url = current.attr('action')
    var method = current.attr('method')
    var data = current.serialize()
    $.ajax({
      url: url,
      method: method,
      data: data
    })
    .done(function(response){
      current.parent().find('p.votes').html('votes: ' + response)
    })
  })
});
