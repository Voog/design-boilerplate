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

		<main class="page-content cfx" role="main">
			<header class="content-header">
				<h1>This is where your products live.</h1>
				<!-- <h1>{% contentblock name="slogan" %}{{ "title_goes_here" | lc }}{% endcontentblock %}</h1> -->
			</header>
			<h2>INTRODUCTION</h2>
			<p>Introduce your products by writing text, showing pictures, building forms, adding galleries. If you don't need a Products page you can rename or delete it from the page properties tool on the lower right corner.</p>
			<h3>This is an example unordered list</h3>
			<ul>
				<li>Item one</li>
				<li>Another item</li>
				<li>Third one</li>
			</ul>
			<h3>This is an example ordered list</h3>
			<ol>
				<li>Item one</li>
				<li>Another item</li>
				<li>Third one</li>
			</ol>
			If you require a more thorough product database or e-commerce, then we've got some great custom solutions for you. Contact Edicy support and let's get it done!
				<!-- {% content %} -->
		</main>

		<?php require("components/site-footer.php") ?>
			<!-- {% include "site-footer" %} -->

	</section>
	<script>project.initCommonPage();</script>
</body>
</html>