;(function($) {
  // Adds class 'active' to main menu current element (Delete this function if the Edicy generated menu has been set up).
  var hightlightActivePage = function() {
    var url = window.location.href;
    console.log(url);
    $('.menu a').filter(function() {
      console.log(this.href);
      return this.href == url;
    }).parent().addClass('active');
  };

  // Initiations
  var initCommonPage = function() {
    
  };

  var initBlogPage = function() {
    
  };

  var initArticlePage = function() {
    
  };

  var init = function() {
    hightlightActivePage();
  };

  window.project = {
    initCommonPage: initCommonPage,
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage
  };

  init();
})(jQuery);