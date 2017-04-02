$(document).ready ->
  $('.nav.nav-pills.nav-stacked input').click ()->
    data =
      message: $(this).val()
      id: $('.item-info').data('id')
    $.ajax
      type: 'POST'
      url: '/drone/update_activity'
      data: data
      dataType: 'js'
  CommonFunction.activate_toolTip()
