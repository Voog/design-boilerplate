;(function($) {
    var toggleMainMenu = function() {
        $('.js-menu-btn').click(function() {
            $(this).toggleClass('open');
            $('.js-main-menu').toggleClass('expanded');
        });
    };

    var toggleLangMenu = function() {
        $('.js-lang-menu-btn').click(function(event) {
            event.stopPropagation();
            $('.js-lang-menu-popover').toggleClass('expanded');
        });
    };

    var handlePopoverMenuHide = function() {
        $('html').click(function() {
            if ($('.js-lang-menu-popover').hasClass('expanded')) {
                $('.js-lang-menu-popover').removeClass('expanded');
            }
        });
    };

    var handleFormFieldClick = function() {
        $('.form_field_with_errors').click(function() {
            $(this).removeClass('form_field_with_errors');
        });
    };

    var focusCommentsWithErrors = function() {
      $(document).ready(function() {
        if ($('.comment-form').hasClass('form_with_errors') === true) {
          $('html, body').scrollTop($('.comment-form').offset().top);
        }
      });
    };

    var wrapTables = function() {
        $('.content-formatted table').wrap('<div class="table-container overthrow"></div>');
    };

    var checkScrollBar = function() {
        jQuery.fn.hasScrollBar = function(direction) {
            if (direction == 'vertical') {
                return this.get(0).scrollHeight > this.innerHeight();
            } else if (direction == 'horizontal') {
                return this.get(0).scrollWidth > this.innerWidth();
            }
            return false;
        }
    };

    var handleTableHorizontalScrolling = function() {
        $.each($('.table-container'), function() {
            if ($(this).hasScrollBar('horizontal') === true) {
                $(this).addClass('horizontal-scroll');
            } else {
                $(this).removeClass('horizontal-scroll');
            }
        });
    };

    var handleWindowResize = function() {
        $(window).resize(function() {
            handleTableHorizontalScrolling();
        });
    };

    // Initiations
    var initBlogPage = function() {
    };

    var initArticlePage = function() {
        handleFormFieldClick();
        focusCommentsWithErrors();
    };

    var init = function() {
        toggleMainMenu();
        toggleLangMenu();
        handlePopoverMenuHide();
        handleWindowResize();
        wrapTables();
        if ($('.table-container').length > 0) {
            checkScrollBar();
            handleTableHorizontalScrolling();
        }
    };

    window.site = $.extend(window.site || {}, {
        initBlogPage: initBlogPage,
        initArticlePage: initArticlePage,
        handleFormFieldClick: handleFormFieldClick
    });

    init();
})(jQuery);
