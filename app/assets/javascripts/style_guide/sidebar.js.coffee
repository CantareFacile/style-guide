getStorage = ->
  if localStorage?
    localStorage.getItem('style-guide-sidebar-status')

setStorage = (value) ->
  if localStorage?
    localStorage.setItem('style-guide-sidebar-status', value)

$ ->
  sidebar = $('.style-guide-sidebar')
  partials = $('.style-guide-partials')
  toggler = $('.style-guide-sidebar-toggler').find('a')

  closeSidebar = ->
    partials.addClass('large')
    sidebar.addClass('closed')
    toggler.addClass('closed')
           .html(toggler.data('closed'))

  openSidebar = ->
    sidebar.removeClass('closed')
    partials.removeClass('large')
    toggler.removeClass('closed')
           .html(toggler.data('open'))

  state = getStorage()
  if state == 'closed'
    closeSidebar()
  else
    openSidebar()

  toggler.on 'click', ->
    if toggler.hasClass('closed')
      openSidebar()
      setStorage('open')
    else
      closeSidebar()
      setStorage('closed')
    false
