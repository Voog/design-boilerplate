;(function($) {
  // Remove comments if debouncing is used.
  // Function to limit the rate at which a function can fire.
  // var debounce = function(func, wait, immediate) {
  //   var timeout;
  //   return function() {
  //     var context = this, args = arguments;
  //     var later = function() {
  //       timeout = null;
  //       if (!immediate) func.apply(context, args);
  //     };
  //     var callNow = immediate && !timeout;
  //     clearTimeout(timeout);
  //     timeout = setTimeout(later, wait);
  //     if (callNow) func.apply(context, args);
  //   };
  // };

  // Switches the site language to the selected value from the language menu.
  var handleLanguageSwitch = function() {
    $('.menu-lang').find('.menu').change(function() {
      window.location = $(this).find(':selected').val();
    });
  };

  // Shows/hides the popover main menu (visible on smalles screens).
  var toggleMainMenu = function() {
    $('.js-menu-btn').click(function() {
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');
    });
  };

  // Hides the popover main menu if cicked anywhere else than the menu itself (visible on smalles screens).
  var handlePopoverMenuHide = function() {
    $('html').click(function() {
      if ($('.js-lang-menu-popover').hasClass('expanded')) {
        $('.js-lang-menu-popover').removeClass('expanded');
      }
    });
  };

  // Removes optional content elements if element doesn't have any content.
  var removeOptionalContent = function() {
    optionalContent = $('.js-content-optional');
    $.each( $(optionalContent), function(){
      optionalContentLength = $(this).text().trim().length;

      if (!optionalContentLength > 0) {
        $(this).remove();
      }
    });
  };

  // Scrolls to the comment-form if comment submit failed (to show the error messages to the user)
  var focusFormWithErrors = function() {
    $(document).ready(function() {
      if ($('.comment-form').hasClass('form_with_errors')) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      } else if ($('form').find('.form_error, .form_notice').length > 0) {
        $('html, body').scrollTop($('.form_error, .form_notice').closest('form').offset().top);
      }
    });
  };

  // Wraps tables in the container.
  // TODO: remove if edicy is going to wrap table with the container.
  var wrapTables = function() {
    $('.content-formatted table').wrap('<div class="table-container overthrow"></div>');
  };

  // Initiates the table horisontal scroll function when window is resized.
  var handleWindowResize = function() {
    // Add functions that should be triggered while resizing the window here.
    // Example:
    // $(window).resize(debounce(yourFunctionName, 3000));
  };

  // FUNCTIONS INITIATIONS
  var initFrontPage = function() {
    // Add front page layout specific functions here.
    removeOptionalContent();
  };

  var initCommonPage = function() {
    // Add common page specific functions here.

  };

  var initBlogPage = function() {
    // Add blog listing layout specific functions here.
  };

  var initPostPage = function() {
    // Add single post layout specific functions here.
  };

  var init = function() {
    // Add site wide functions here.
    handleLanguageSwitch();
    toggleMainMenu();
    focusFormWithErrors();
    handlePopoverMenuHide();
    handleWindowResize();
    wrapTables();
  };

  // Enables the usage of the initiations outside this file.
  // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
  window.site = $.extend(window.site || {}, {
    initFrontPage: initFrontPage,
    initCommonPage: initCommonPage,
    initBlogPage: initBlogPage,
    initPostPage: initPostPage
  });

  // Initiates site wide functions.
  init();
})(jQuery);
