<nav class="post-tags">
	<h3>Topics</h3>
	<ul class="menu horizontal tags-menu">
		<li><a href="blog-and-news.php">All topics,</a></li>
		<li><a href="#">Animals,</a></li>
		<li><a href="#">Monsters,</a></li>
		<li><a href="#">Mammals,</a></li>
		<li><a href="#">Humans,</a></li>
		<li><a href="#">Aliens</a></li>
	</ul>
</nav>
	<!--
	<nav class="post-tags">
		{% if editmode %}
			{% editable article.tags %}
		{% else %}
		<h3>{% case page.language_code %}{% when 'et' %}Teemad{% else %}Topics{% endcase %}</h3>
		<ul class="menu horizontal tags-menu">
			<li><a href="/{{ site.blogs.first.page.path }}">{% case page.language_code %}{% when 'et' %}Kõik teemad {% else %}All topics{% endcase %}</a></li>
			{% for tag in article.tags %}
				<li><a href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">, {{ tag.name }}</a></li>
			{% endfor %}
		</ul>
		{% endif %}
	</nav>
	-->