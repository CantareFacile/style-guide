;(function() {
  var KssStateGenerator;
  KssStateGenerator = (function() {
    function KssStateGenerator() {
      var idx, idxs, pseudos, replaceRule, rule, stylesheet, _i, _len, _len2, _ref, _ref2;
      pseudos = /(\:hover|\:disabled|\:active|\:visited|\:focus)/g;
      try {
        var replaceRule = function(matched, stuff) {
          return ".pseudo-class-" + matched.replace(':', '');
        };
        _ref = document.styleSheets;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          stylesheet = _ref[_i];
          idxs = [];
          _ref2 = stylesheet.cssRules;
          for (idx = 0, _len2 = _ref2.length; idx < _len2; idx++) {
            rule = _ref2[idx];
            if ((rule.type === CSSRule.STYLE_RULE) && pseudos.test(rule.selectorText)) {
              this.insertRule(rule.cssText.replace(pseudos, replaceRule));
            }
          }
        }
      } catch (_e) {}
    }
    KssStateGenerator.prototype.insertRule = function(rule) {
      if (!this.styleEl) {
        this.headEl = document.getElementsByTagName('head')[0];
        this.styleEl = document.createElement('style');
        this.styleEl.type = 'text/css';
      }

      if (this.styleEl.styleSheet) {
        this.styleEl.styleSheet.cssText += rule;
      } else {
        this.styleEl.appendChild(document.createTextNode(rule));
      }
      return this.headEl.appendChild(this.styleEl);
    };
    return KssStateGenerator;
  })();
  new KssStateGenerator;
})();