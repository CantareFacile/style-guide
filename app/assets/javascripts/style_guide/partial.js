$(function() {
  var $sources = document.querySelectorAll(".style-guide-partial-source");

  function eventDefaultPreventer(event) {
    event.preventDefault();
  }

  function preventDefaultOnClick(elements) {
    for (var i = 0, element; element = elements[i]; i++) {
      element.onclick = eventDefaultPreventer;
    }
  }

  preventDefaultOnClick($sources);
});