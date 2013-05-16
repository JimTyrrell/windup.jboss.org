function activateScrollingToc(sections) {
  var $toc = $('#toc');
  $toc.localScroll({hash: true});
  var currentSection = false;
  var sectionOffsets = {};
  $.each(sections, function(idx, section) {
    sectionOffsets[section] = $('#' + section).position().top;
  });
  
  var tocMetrics = {
    top: $toc.position().top,
    height: $toc.outerHeight()
  };
  var bottomBumper = $('#guide').outerHeight() + $('#guide').offset().top - 25;
  var $firstLink = $('#toc a').first();
  var linkColor = $firstLink.css('color');
  var linkTextDecoration = $firstLink.css('text-decoration');
  var selectedColor = $firstLink.parent().css('color');
  var selectedTextDecoration = (linkTextDecoration == 'underline' ? 'none' : 'underline');

  var updateToc = function() {
    var scrollY = $(window).scrollTop();
    positionToc(scrollY);
    highlightSectionInToc(scrollY);
  }

  var positionToc = function(scrollY) {
    // if scrolled past toc, move it down
    if (scrollY > tocMetrics.top-55) {
      if ($toc.css('position') != 'fixed') {
        $toc.css('position', 'fixed');
      }
      var remainingHeight = bottomBumper - scrollY;
      // keep toc from overrunning bottom of content
      if (remainingHeight < tocMetrics.height) {
        $toc.css('top', 0 - (tocMetrics.height - remainingHeight));
      }
      else {
        $toc.css('top', 60);
      }
    }
    else {
      if ($toc.css('position') != 'static') {
        $toc.css({position: 'static', top: 0});
      }
    }
  };

  var highlightSectionInToc = function(scrollY) {
    var numSections = sections.length;
    if (numSections == 0) {
      return;
    }

    // if scrolled above first section, unhighlight any
    if (scrollY < sectionOffsets[sections[0]]) {
      toggleSelection(false);
    }
    // if last section is in view, highlight it
    // tweak to get last section to be highlighted in toc when scrolled to bottom of page
    //else if (scrollY + $(window).height() > sectionOffsets[sections[numSections - 1]] &&
    //    scrollY - 100 > sectionOffsets[sections[numSections - 2]]) {
    //  toggleSelection(sections[numSections - 1]);
    //}
    else if (scrollY + $(window).height() == $(document).height()) {
      toggleSelection(sections[numSections - 1]);
    }
    // highlight visible section
    else {
      $.each(sections, function(idx, section) {
        if (scrollY > sectionOffsets[section] && (idx == numSections - 1 || scrollY < sectionOffsets[sections[idx + 1]])) {
          toggleSelection(section);
        }
      });
    }
  }

  var toggleSelection = function(section) {
    if (!section || section != currentSection) {
      if (currentSection) {
        $('#' + currentSection + '_link').css({textDecoration: linkTextDecoration, color: linkColor});
      }
      currentSection = section;
      if (section) {
        $('#' + section + '_link').css({textDecoration: selectedTextDecoration, color: selectedColor});
      }
    }
  }

  updateToc();
  $(window).scroll(updateToc);
}

