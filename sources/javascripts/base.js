;(function($) {
  //============================================================================
  // Helper function to detect if page viewer is in editmode.
  //============================================================================
  var editmode = function () {
    return $('html').hasClass('editmode');
  };

  //============================================================================
  // Helper function to limit the rate at which a function can fire.
  //============================================================================
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

  //============================================================================
  // Bind site buttons functionality.
  //============================================================================
  var bindButtonClicks = function() {
    // Triggers the events when clicked anywhere on the document. Used for
    // sideclick functionality. Use the class "js-prevent-sideclick" on elements
    // that shouldn't trigger the sideclick events.
    $(document).on('click', function(event) {
      if (!$(event.target).closest('.js-prevent-sideclick').length) {
        $('html').removeClass('menu-language-popover-open');
      }
    });

    // language menu popover with flags.
    // By default this template uses the simple text listing version of the
    // language menu and popover menu with flags is disabled. Follow the
    // instructions in "components/site-header.tpl" to enable language menu
    // popover with flags.
    /*
      $('.js-toggle-menu-language').click(function() {
        if (!$('html').hasClass('menu-language-popover-open')) {
          handleMenuLanguagePopoverPositioning();
        } else {
          $('html').removeClass('menu-language-popover-open');
        }
      });
    */
  };

  //============================================================================
  // Positions language menu popover under the toggleing button.
  //
  // By default this template uses the simple text listing version of the
  // language menu and popover menu with flags is disabled. Follow the
  // instructions in "components/site-header.tpl" to enable language menu
  // popover with flags.
  //============================================================================
  /*
    var handleMenuLanguagePopoverPositioning = function(button) {
      var $menuWrapper = $('.js-menu-language-popover'),
          $offsetItem = $('.js-toggle-menu-language'),
          offsetItemOffsetTop = $offsetItem.offset().top,
          offsetItemOffsetLeft = $offsetItem.offset().left,
          offsetItemOuterWidth = $offsetItem.outerWidth(),
          offsetItemOuterHeight = $offsetItem.outerHeight(),
          windowWidth = $(window).width();

      $('html').addClass('menu-language-popover-open');

      $menuWrapper.css({
        top: offsetItemOffsetTop + offsetItemOuterHeight,
        right: windowWidth - offsetItemOffsetLeft - offsetItemOuterWidth
      });
    };
  */

  //============================================================================
  // Toggles language flags state.
  //
  // By default this template uses the simple text listing version of the
  // language menu and popover menu with flags is disabled. Follow the
  // instructions in "components/site-header.tpl" to enable language menu
  // popover with flags.
  //============================================================================
  /*
    var bindLanguageFlagsToggle = function() {
      $('.js-toggle-language-flags').click(function() {
        if ($('html').hasClass('language-flags-disabled')) {
          $('html')
            .removeClass('language-flags-disabled')
            .addClass('language-flags-enabled');

          siteData.set("language_flags_enabled", true);
        } else {
          $('html')
            .removeClass('language-flags-enabled')
            .addClass('language-flags-disabled');

          siteData.set("language_flags_enabled", false);
        }
      });
    };
  */

  //============================================================================
  // Binds site search functionality.
  //============================================================================
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
        // Uncomment the <div class="custom-search-container"></div> element in
        // the "components/site-search.tpl" or add your own container to proper
        // place in the code if custom container is used.
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
    bindButtonClicks();
  };

  // Enables the usage of the initiations outside this file.
  window.site = $.extend(window.site || {}, {
    // Initiations for layouts.
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage,
    initCommonPage: initCommonPage,
    initFrontPage: initFrontPage,
    // Initiations for specific functions.
    bindSiteSearch: bindSiteSearch/*,*/
    // Initiation for the language flags visibility state saving.
    // By default this template uses the simple text listing version of the
    // language menu and popover menu with flags is disabled. Follow the
    // instructions in "components/site-header.tpl" to enable language menu
    // popover with flags.
    // NB! Don't forget to uncomment the comma after "bindSiteSearch" if
    // enabling the "bindLanguageFlagsToggle"
    /*
      bindLanguageFlagsToggle: bindLanguageFlagsToggle
    */
  });

  init();
})(jQuery);
