;(function($) {
  var fileName = window.location.href.substr(window.location.href.lastIndexOf("/")+1);

  var duplicateArticles = function() {
    if (fileName == "blog-and-news.php") {
      article = $('.post').html();
      for (var i = 0; i < 2; i++) {
        $('.page-content').append(article);
      }
    }
  };

  var hightlightActivePage = function() {
    var url = window.location.href;
    $('.menu a').filter(function() {
      return this.href == url;
    }).parent().addClass('active');
  };

  var initEditor = function() {
    duplicateArticles();
    hightlightActivePage();
  };

  initEditor();
})(jQuery);