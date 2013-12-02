<nav class="post-tags">
	<ul class="menu horizontal tags-menu">
		<li class="posts-all"><a href="blog-and-news.php">All topics,</a></li>
		<li><a href="#nothing">Animals,</a></li>
		<li><a href="#nothing">Monsters,</a></li>
		<li><a href="#nothing">Mammals,</a></li>
		<li><a href="#nothing">Humans,</a></li>
		<li><a href="#nothing">Aliens</a></li>
	</ul>
</nav>
	<!--
	{% if site.has_language_tags? %}
		<nav class="post-tags">
			<ul class="menu horizontal tags-menu">
				<li class="posts-all"><a href="/{{ site.blogs.first.page.path }}">{% case page.language_code %}{% when 'et' %}Kõik teemad{% else %}All topics{% endcase %}</a></li>
				{% for tag in site.language_tags %}
					{% assign activestr = " " %}
					{% for tmptag in tags %}
						{% if tmptag.name == tag.name %}
							{% assign activestr = " class='active'" %}
						{% endif %}
					{% endfor %}
					<li {{ activestr }}><a href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
				{% endfor %}
			</ul>
		</nav>
	{% endif %}
	-->