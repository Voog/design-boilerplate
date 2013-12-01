<header class="main-header">
	<section class="main-header-left">
		<div class="header-logo cfx">
			<div role="banner">Site title</div>
				<!-- {% editable site.header %} -->
		</div>
	</section>

	<section class="main-header-right">
		<nav class="main-menu" role="navigation">
			<ul class="menu menu-horizontal cfx">
				<li><a href="index.php">Home</a></li>
				<li><a href="products.php">Products</a></li>
				<li><a href="blog-and-news.php">News or Blog</a></li>
				<li><a href="elements-listing.php">Elements listing</a></li>
				<li><a href="gallery.php">Gallery</a></li>
				<li><a href="form.php">Form</a></li>
				<li><a href="table.php">Table</a></li>
			</ul>
		</nav>
			<!--
			<nav class="main-menu cfx" role="navigation">
				<ul class="menu horizontal">
					{% unless site.root_item.hidden? %}
						<li {% if site.root_item.selected? %} class="active"{% endif %}><a href="{{site.root_item.url}}">{{site.root_item.title}}</a></li>
					{% endunless %}
					{% for item in site.visible_menuitems %}
						<li {% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}><a href="{{ item.url }}" >{{ item.title }}</a></li>  
					{% endfor %}
					{% if editmode %}
						<li>{% menubtn site.hidden_menuitems %}</li>
						<li>{% menuadd %}</li>
					{% endif %}
				</ul>
			</nav>
			-->

		<section class="search-area">
			<form id="search" class="edys-search" role="search" method="get" action="#">
				<input id="onpage_search" class="edys-search-input" type="text" placeholder="Search" name="">
				<input class="search-submit" type="submit" value="Search" name="">
			</form>
			<div id="customsearch"></div>
		</section>
			<!--
			{% if site.search.enabled %}
				<section class="search-wrap">
					<form id="search" class="edys-search" role="search" method="get" action="#">
						<input id="onpage_search" class="edys-search-input" type="text" placeholder="Search" name="">
						<input class="search-submit" type="submit" value="" name="">
					</form>
					<div id="customsearch"></div>
				</section>
			{% endif %}
			-->

		<section class="lang-menu">
			<button class="lang-btn et">English</button>
			<nav class="lang-menu-popover">
				<ul class="menu">
					<li class="active"><a href="#" class="en">In English</a></li>
					<li><a href="#" class="et">Eesti keeles</a></li>
					<li><a href="#" class="fi">Suomi</a></li>
				</ul>
			</nav>
		</section>
			<!--
			{% if editmode %}
				<section class="lang-menu">
					{% for language in site.languages %}{% if language.selected? %}<button class="lang-btn {{ language.code }}">{{ language.title }}</button>{% endif %}{% endfor %}
					<nav class="lang-menu-popover">
						<ul class="menu">
							{% for language in site.languages %}
								<li {% if language.selected? %}class="active"{% endif %}><a href="{{ language.url }}" class="{{ language.code }}">{{ language.title }}</a></li>
							{% endfor %}
							<li>{% languageadd %}</li>
						</ul>
					</nav>
				</section>
			{% else %}
				{% if site.has_many_languages? %}
					<section class="lang-menu">
						{% for language in site.languages %}{% if language.selected? %}<button class="lang-btn {{ language.code }}">{{ language.title }}</button>{% endif %}{% endfor %}
						<nav class="lang-menu-popover">
							<ul class="menu">
								{% for language in site.languages %}
									<li {% if language.selected? %}class="active"{% endif %}><a href="{{ language.url }}" class="{{ language.code }}">{{ language.title }}</a></li>
								{% endfor %}
							</ul>
						</nav>
					</section>
				{% endif %}
			{% endif %}
			-->

	</section>
</header>