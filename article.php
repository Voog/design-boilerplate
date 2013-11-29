<!DOCTYPE html>
<html lang="et">
	<!-- <html lang="{{ page.language_code }}"> -->
<head>
	<?php require("components/html-head.php") ?>
		<!-- {% include "html-head" %} -->
</head>
<body>
	<section class="site-wrap cfx">
		<?php require("components/site-header.php") ?>
			<!-- {% include "site-header" %} -->

		<main class="page-content cfx" role="main">
			<article class="post">
				<header class="post-header">
					<h1 class="post-title"><a href="article.php">Siin on näidisblogipostitus, mis kirjeldab viimaseid uudiseid.</a></h1>
					<time datetime="2013-11-25" class="post-date">25.11.2013</time>
				</header>
				<section class="post-excerpt">
					<p>Siia saad postitada oma ettevõtte või millegi muu kohta uudiseid.</p>
				</section>
				<section class="post-body">
					<p>Blogipostituse kustutamise võimalus avaneb Uudiste ja Blogi nupust. Klõpsi lihtsalt vastava postituse ikooni peale ilmuvale kustutamisnupule.</p>
				</section>
			</article>
		</main>

		<?php require("components/site-footer.php") ?>
			<!-- {% include "site-footer" %} -->

	</section>
	<script>project.initArticlePage();</script>
</body>
</html>