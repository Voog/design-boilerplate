;(function($) {
	// Functions
	var commonFunction = function() {
		console.log('Do stuff on common pages');
	};

	var blogFunction = function() {
		console.log('Do stuff on blog & news pages');
	};

	var articleFunction = function() {
		console.log('Do stuff on article pages');
	};

	var globalFunction = function() {
		console.log('Do stuff everywhere');
	};

	// Initiations
	var initCommonPage = function() {
		commonFunction();
	};

	var initBlogPage = function() {
		blogFunction();
	};

	var initArticlePage = function() {
		articleFunction();
	};

	var init = function() {
		globalFunction();
	};

	window.project = {
		initCommonPage: initCommonPage,
		initBlogPage: initBlogPage,
		initArticlePage: initArticlePage
	};

	init();
})(jQuery);