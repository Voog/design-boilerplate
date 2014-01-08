;(function($) {
  // Adds class 'active' to main menu current element (Delete this function if the Edicy generated menu has been set up).
  var hightlightActivePage = function() {
    var url = window.location.href;
    $('.menu a').filter(function() {
      return this.href == url;
    }).parent().addClass('active');
  };

  // Shows and hides specific elements on common, blog and article pages (Use liquid instead).
  var commonPageSettings = function() {
    $('.header-banner').hide();
  };

  // Initiations
  var initFrontPage = function() {
    $('.header-left').hide();
  };

  var initCommonPage = function() {
    commonPageSettings();
  };

  var initBlogPage = function() {
    commonPageSettings();
  };

  var initArticlePage = function() {
    commonPageSettings();
  };

  var init = function() {
    hightlightActivePage();
  };

  window.project = {
    initFrontPage: initFrontPage,
    initCommonPage: initCommonPage,
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage
  };

  init();
})(jQuery);