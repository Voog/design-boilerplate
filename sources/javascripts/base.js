;(function($) {
  // Function to detect if page viewer is in editmode.
  var editmode = function () {
    return $('html').hasClass('editmode');
  };

  // Function to limit the rate at which a function can fire.
  var debounce = function(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  // Bind site buttons functionality.
  var bindButtonClicks = function() {
    $(document).on('click', function(event) {
      console.log(event);
      if (!$(event.target).closest('.js-prevent-sideclick').length) {
        console.log('fdsa');
        $('html').removeClass('menu-language-popover-open');
      }
    });


    // $('.js-toggle-menu-language').click(function() {
    //   if (!$('html').hasClass('menu-language-popover-open')) {
    //     bindMenuLanguagePositioning();
    //   } else {
    //     $('html').removeClass('menu-language-popover-open');
    //   }
    // });
  };

  // Positions language menu popover.
  // var bindMenuLanguagePositioning = function(button) {
  //   var $menuWrapper = $('.js-menu-language-popover'),
  //       $offsetItem = $('.js-toggle-menu-language');

  //   $('html').addClass('menu-language-popover-open');

  //   $menuWrapper.css({
  //     top: $offsetItem.offset().top + $offsetItem.outerHeight(),
  //     right: $(window).width() - $offsetItem.offset().left - $offsetItem.outerWidth()
  //   });
  // };

  var bindSiteSearch = function(searchForm, languageCode) {
    if (searchForm) {
      var search = new VoogSearch(searchForm, {
        // Results are lazy-loaded on scroll.
        // This defines the number of results per query.
        per_page: 10,

        // Language code for restricting the search to page language
        lang: languageCode,

        // If given an DOM element results are rendered inside that element
        // instead of modal (with scroll lazy load support).
        // Example: resultsContainer: $('.custom-search-container').get(0),
        // Uncomment the <div class="custom-search-container"></div> element in the "components/site-search.tpl" or add your
        // own container to proper place in the code if custom container is used.
        resultsContainer: null,

        // Defines if modal should close on sideclick
        sideclick: true,

        // Mobile checkpoint (adds class "voog-search-mobile-mode" if <= nr)
        mobileModeWidth: 640,

        // Updates results on every keypress
        updateOnKeypress: false
      });
    }
  };

  // Initiations
  var initWindowResize = function() {
    $(window).resize(function() {
      // Add window resizing functions here.
    });
  };

  var initBlogPage = function() {
    // Add blog listing layout specific functions here.
  };

  var initArticlePage = function() {
    // Add single post layout specific functions here.
  };

  var initCommonPage = function() {
    // Add common page layout specific functions here.
  };

  var initFrontPage = function() {
    // Add front page layout specific functions here.
  };

  var init = function() {
    // Add site wide functions here.
    // TODO: Replace with click.
    bindButtonClicks();r
  };

  // Enables the usage of the initiations outside this file.
  window.site = $.extend(window.site || {}, {
    // Initiations for layouts.
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage,
    initCommonPage: initCommonPage,
    initFrontPage: initFrontPage,
    // Initiations for specific functions.
    bindSiteSearch: bindSiteSearch
  });

  init();
})(jQuery);
