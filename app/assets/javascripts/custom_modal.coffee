
$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  result = link.attr('data-modal-result')
  if result
    link.removeAttr('data-modal-result')
    return result == 'true'
  else
    $.rails.showConfirmDialog(link)
    return false

$.rails.showConfirmDialog = (link) ->

  default_confirm_options =
    title: 'Подтверждение'
    yes: 'Подтвердить'
    no: 'Закрыть'

  dialog = $('#modal-confirm')
  dialog_window = dialog.find('.dialog')

  $('body').css('overflow', 'hidden')

  if $('body')[0].scrollHeight > $(window).height()
    $('body').find('#topbar').andSelf().width($('body').width() - getScrollBarWidth())

  confirm_options = $.extend {}, default_confirm_options, link.data('confirm-options')
  dialog.find('.body').text(link.attr 'data-confirm').end()
        .find('.header').text(confirm_options.title || 'Подтверждение').end()
        .find("[data-modal-result='true']").text(confirm_options.yes || 'Подтвердить').end()
        .find("[data-modal-result='false']").text(confirm_options.no || 'Закрыть')
  dialog.show()
  dialog_window.css('top', ($(window).height() - dialog_window.height()) / 2)
               .css('left', ($(window).width() - dialog_window.width()) / 2)

  dialog.one 'click', '[data-modal-result]', (e) ->
    link.attr('data-modal-result', $(@).attr('data-modal-result'))
    $('body').css('overflow', '').find('#topbar').andSelf().css(width: '')
    dialog.hide()
    link.trigger 'click.rails'
