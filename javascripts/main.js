;(function($) {
	// Example functions
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

	// General functions
	var toggleMainMenu = function() {
		$('.menu-btn').click(function() {
			$('.main-menu').toggleClass('expanded');
		});
	};
	
	var toggleLangMenu = function() {
		$('.lang-btn').click(function(event) {
			event.stopPropagation();
			$('.lang-menu-popover').toggleClass('visible');
			if ($('.lang-menu-popover').hasClass('visible')) {
				$('.lang-menu-popover').fadeIn('fast');
			} else {
				$('.lang-menu-popover').fadeOut('fast');
			}
		});
	};

	var handlePopoverMenuHide = function() {
		$('html').click(function() {
			if ($('.lang-menu-popover').hasClass('visible')) {
				$('.lang-menu-popover').removeClass('visible').fadeOut('fast');
			}
		});
	};

	var handleWindowResize = function() {
	};

	// Adds class 'active' to main menu current element (Delete this function if the Edicy generated menu has been set up).
	var hightlightActivePage = function() {
		var url = window.location.href;
		$('.menu a').filter(function() {
			return this.href == url;
		}).parent().addClass('active');
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
		toggleMainMenu();
		toggleLangMenu();
		handlePopoverMenuHide();
		handleWindowResize();
		hightlightActivePage();
	};

	window.project = {
		initCommonPage: initCommonPage,
		initBlogPage: initBlogPage,
		initArticlePage: initArticlePage
	};

	init();
})(jQuery);