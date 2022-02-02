; (function ($) {
  // ===========================================================================
  // Binds site search functionality.
  // ===========================================================================
  var bindSiteSearch = function (searchForm, languageCode, noResultsString) {
    if (searchForm) {
      var search = new VoogSearch(searchForm, {
        // This defines the number of results per query.
        per_page: 10,
        // Language code for restricting the search to page language.
        lang: languageCode,
        // If given, an DOM element results are rendered inside that element
        resultsContainer: $('.js-voog-search-modal-inner').get(0),
        // Defines if modal should close on sideclick.
        sideclick: true,
        // Mobile checkpoint
        mobileModeWidth: 480,
        // Updates results on every keypress.
        updateOnKeypress: true,
        // String for feedback if no results are found.
        noResults: noResultsString
      });
    }
  };

  // Function to limit the rate at which a function can fire.
  var debounce = function (func, wait, immediate) {
    var timeout;
    return function () {
      var context = this, args = arguments;
      var later = function () {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  var bindSideClicks = function () {
    $('.container').on('mousedown', function (event) {
      if (!$(event.target).closest('.js-prevent-sideclick').length) {
        $('.js-popover').removeClass('expanded');
        $('.js-search-close-btn').trigger('click');
        $('.js-image-settings-popover').toggleClass('active');
      };
    });
  };

  // Switches the site language to the selected value from the language menu.
  var handleLanguageSwitch = function () {
    $('.menu-lang').find('.menu').change(function () {
      window.location = $(this).find(':selected').val();
    });
  };

  // Shows/hides the popover main menu (visible on smalles screens).
  var toggleMainMenu = function () {
    $('.js-menu-btn').click(function () {
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');
    });
  };

  // Removes optional content elements if element doesn't have any content.
  var removeOptionalContent = function () {
    optionalContent = $('.js-content-optional');
    $.each($(optionalContent), function () {
      optionalContentLength = $(this).text().trim().length;

      if (!optionalContentLength > 0) {
        $(this).remove();
      }
    });
  };

  // Scrolls to the comment-form if comment submit failed (to show the error messages to the user)
  var focusFormWithErrors = function () {
    $(document).ready(function () {
      if ($('.comment-form').hasClass('form_with_errors')) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      } else if ($('form').find('.form_error, .form_notice').length > 0) {
        $('html, body').scrollTop($('.form_error, .form_notice').closest('form').offset().top);
      }
    });
  };

  // ===========================================================================
  // Load product cover images only when they are close or appearing in the
  // viewport.
  // ===========================================================================
  var callback_loaded = function (element) {
    var $contentItemBox = $(element).closest('.js-content-item-box');
    $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');
  };

  var bindContentItemImageLazyload = new LazyLoad({
    threshold: 500,
    elements_selector: ".js-lazyload",
    callback_loaded: callback_loaded
  });

  $('.js-cart-btn').click(function() {
    if ($(this).data('product-id')) {
      Voog.ShoppingCart.addProductById($(this).data('product-id'))
    }
  });

  var editmode = function () {
    return $('html').hasClass('editmode');
  };

  // Wraps tables in the container.
  // TODO: remove if edicy is going to wrap table with the container.
  var wrapTables = function () {
    $('.content-formatted table').wrap('<div class="table-container"></div>');
  };

  // Change product image position on narrower screens (mobile devices)
  var handleProductPageContent = function () {
    $(document).ready(function () {
      changeProductImagePos();
    });

    $(window).resize(debounce(function () {
      changeProductImagePos();
    }, 25));

    var changeProductImagePos = function () {
      var productGallery = $('.js-product-gallery');
      var productImageContentBox = $('.js-content-item-box');
      var buyBtnContent = $('.js-buy-btn-content');

      if ($('.js-buy-btn-content .edy-buy-button-container').length >= 1) {
        if ($(window).width() < 752) {
          if ($('.js-buy-btn-content + .js-product-gallery').length === 0) {
            buyBtnContent.append(productGallery);
          }
        } else {
          if ($('.js-content-item-box + .js-product-gallery').length === 0) {
            productImageContentBox.append(productGallery);
          }
        }
      }
    }
  };

// Initiates the table horisontal scroll function when window is resized.
  var handleWindowResize = function() {
    // Add functions that should be triggered while resizing the window here.
    // Example:
    // $(window).resize(debounce(yourFunctionName, 3000));
  };

  // FUNCTIONS INITIATIONS
  var initFrontPage = function () {
    // Add front page layout specific functions here.
    removeOptionalContent();
  };

  var initCommonPage = function () {
    // Add common page specific functions here.

  };

  var initProductListPage = function () {
    // Add product list page specific functions here.
  };

  var initProductPage = function () {
    // Add product page specific functions here.
  };

  var initBlogPage = function () {
    // Add blog listing layout specific functions here.
  };

  var initPostPage = function () {
    // Add single post layout specific functions here.
  };

  var init = function () {
    // Add site wide functions here.
    bindSideClicks();
    handleLanguageSwitch();
    toggleMainMenu();
    focusFormWithErrors();
    handleWindowResize();
    if (!editmode()) {
      wrapTables();
    }
  };

  // Enables the usage of the initiations outside this file.
  // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
  window.site = $.extend(window.site || {}, {
    initFrontPage: initFrontPage,
    initCommonPage: initCommonPage,
    initProductPage: initProductPage,
    initProductListPage: initProductListPage,
    initBlogPage: initBlogPage,
    initPostPage: initPostPage,
    bindSiteSearch: bindSiteSearch
  });

  window.template = $.extend(window.template || {}, {
    handleProductPageContent: handleProductPageContent
  });

  // Initiates site wide functions.
  init();
})(jQuery);
