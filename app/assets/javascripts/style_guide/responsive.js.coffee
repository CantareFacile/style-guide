$ ->
  $('#style-guide-open-windows').on 'click', ->
    baseSettings = ',toolbar=0,directories,location=0,status=0,titlebar=0'
    settings = "height=470,width=310,left=0,top=0#{baseSettings}"
    iPhone = window.open(location.href, 'style-guide-iphone', settings)

    settings = "height=940,width=630,left=310,top=0#{baseSettings}"
    iPhone4 = window.open(location.href, 'style-guide-iphone4', settings)

    settings = "height=660,width=980,left=940,top=0#{baseSettings}"
    iPad = window.open(location.href, 'style-guide-ipad', settings)
