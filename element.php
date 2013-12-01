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
				<!--
				<h1>{% editable element.title %}</h1>
				<time datetime="{{ element.time }}">{% editable element.time %}</time>
				{% unless editmode %}
				  <img alt="{{ element.title }}" title="{{ element.title }}" src="{{ element.picture }}">
				{% else %}
				  <div>{% editable element.picture %}</div>
				{% endunless %}
				<div>{% editable element.option %}</div>
				<p>{% editable element.info %}</p>
				-->
		</main>

		<?php require("components/site-footer.php") ?>
			<!-- {% include "site-footer" %} -->
	</section>
	<script>project.initBlogPage();</script>
</body>
</html>