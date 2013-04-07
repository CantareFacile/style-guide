$ ->
  # This class scans your stylesheets for pseudo classes, then inserts a new CSS
  # rule with the same properties, but named 'psuedo-class-{{name}}'.
  #
  # Supported pseudo classes: hover, disabled, active, visited, focus.
  #
  # Example:
  #
  #   a:hover{ color:blue; }
  #   => a.pseudo-class-hover{ color:blue; }
  class KssStateGenerator
    constructor: ->
      pseudos = /(\:hover|\:disabled|\:active|\:visited|\:focus)/g

      replaceRule = (matched, stuff) ->
        return matched.replace(/\:/g, '.pseudo-class-')

      for stylesheet in document.styleSheets
        if stylesheet.href.indexOf(document.domain) >= 0
          for rule in stylesheet.cssRules
            if (rule.type == CSSRule.STYLE_RULE) && pseudos.test(rule.selectorText)
              @insertRule(rule.cssText.replace(pseudos, replaceRule))

    # Takes a given style and attaches it to the current page.
    #
    # rule - A CSS rule String (ex: ".test{ display:none; }").
    #
    # Returns nothing.
    insertRule: (rule) ->
      unless @styleEl
        @styleEl = document.createElement('style')
        @styleEl.type = 'text/css'
        headEl = document.getElementsByTagName('head')[0]
        headEl.appendChild(@styleEl)

      if @styleEl.styleSheet
        @styleEl.styleSheet.cssText = rule
      else
        @styleEl.appendChild(document.createTextNode(rule))



  new KssStateGenerator