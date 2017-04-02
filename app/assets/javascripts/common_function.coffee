@CommonFunction = {};

CommonFunction.activate_toolTip = () ->
  $('.nav-stacked li button.btn').mouseenter(->
    $(this).next().css('opacity', 1)
  ).mouseout ->
    $(this).next().css('opacity', 0)
