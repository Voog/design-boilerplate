;(function($) {
  // Toggle mobile menu
  var menuToggle = function() {
    $('.js-menu-toggle').click(function() {
      $(this).next().toggleClass('expanded');
    });
  };

  // Initiations
  var initCommonPage = function() {
  };

  var initBlogPage = function() {
  };

  var initArticlePage = function() {
  };

  var init = function() {
    menuToggle();
  };

  window.project = {
    initCommonPage: initCommonPage,
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage
  };

  init();
})(jQuery);