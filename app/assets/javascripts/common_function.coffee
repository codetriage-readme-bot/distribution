@CommonFunction = {};

CommonFunction.activateToolTip = () ->
  $('.nav-stacked li button.btn').mouseenter(->
    $(this).next().removeClass('hide')
  ).mouseout ->
    $(this).next().addClass('hide')
  $('.nav-stacked li button.btn').click (e)->
    e.stopImmediatePropagation()
    return false

CommonFunction.updateProgressBar = (length, url = false)->
  $('.progress-bar').css('width', length + '%' )
  if(url)
    setTimeout (->
      window.location.href = url
      return
    ), 300
