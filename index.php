<!DOCTYPE html>
<html lang="et">
	<!-- <html lang="{{ page.language_code }}"> -->
<head>
	<?php require("components/html-head.php") ?>
		<!-- {% include "html-head" %} -->
</head>

<body>
	<section class="site-content cfx">
		<?php require("components/site-header.php") ?>
			<!-- {% include "site-header" %} -->

		<main class="page-content cfx" role="main">
			<header class="content-header">
				<h1>Here's a good place for your slogan.</h1>
				<!-- <h1>{% contentblock name="slogan" %}{{ "title_goes_here" | lc }}{% endcontentblock %}</h1> -->
			</header>
			<h2>A BETTER WAY TO CREATE A WEBSITE</h2>
			<p>Introduce your company (or yourself) here. Click around, try out how to edit text, choose a different design theme, upload pictures etc. This site is fully customizable — you can add, delete, modify any text or pictures as you desire.</p>
				<!-- {% content %} -->
		</main>

		<?php require("components/site-footer.php") ?>
			<!-- {% include "site-footer" %} -->

	</section>
	<script>project.initCommonPage();</script>
</body>
</html>