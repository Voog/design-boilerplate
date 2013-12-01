<!DOCTYPE html>
<html lang="et">
	<!-- <html lang="{{ page.language_code }}"> -->
<head>
	<?php require("components/html-head.php") ?>
		<!-- {% include "html-head" %} -->
</head>
<body>
	<main class="site-content cfx" role="main">
		<?php require("components/site-header.php") ?>
			<!-- {% include "site-header" %} -->

		<main class="site-content cfx" role="main">
			<a href="#">+ New Object</a>
			<article class="element">
				<h1><a href="element.php">First element</a></h1>
				<time datetime="2014-10-09">2014-10-09</time>
				<img alt="First element" title="First element" src="http://placeimg.com/320/240/any">
				<div>True</div>
				<p>Lorem ipsum dolor sit amet.</p>
			</article>

			<article class="element">
				<h1><a href="element.php">Second element</a></h1>
				<time datetime="2014-10-09">2014-10-09</time>
				<img alt="Second element" title="Second element" src="http://placeimg.com/321/241/any">
				<div>True</div>
				<p>Lorem ipsum dolor sit amet.</p>
			</article>

			<article class="element">
				<h1><a href="element.php">Third element</a></h1>
				<time datetime="2014-10-09">2014-10-09</time>
				<img alt="Third element" title="Third element" src="http://placeimg.com/322/242/any">
				<div>True</div>
				<p>Lorem ipsum dolor sit amet.</p>
			</article>
				<!--
				{% addbutton %} - For page with one catalogue
				{% addbutton element_type="Element" %} - For page with multiple catalogues
				{% for element in elements %}
					<h1><a href="{{ element.url }}">{{ element.title }}</a></h1>
					<time datetime="{{ element.time }}">{{ element.time }}</time>
					<img alt="{{ element.title }}" title="{{ element.title }}" src="{{ element.picture }}>
					<div>{{ element.option }}</div>
					<p>{{ element.info }}</p>
				{% endfor %}
				-->
		</main>

		<?php require("components/site-footer.php") ?>
			<!-- {% include "site-footer" %} -->
	</section>
	<script>project.initBlogPage();</script>
</body>
</html>