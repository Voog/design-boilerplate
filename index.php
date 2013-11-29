<!DOCTYPE html>
<html lang="{{ page.language_code }}">
<head>
	<?php require("components/html-head.php") ?>
		<!-- {% include "html-head" %} -->
</head>

<body>
	<section class="site-content cfx">
		<?php require("components/site-header.php") ?>
			<!-- {% include "site-header" %} -->

		<main class="page-content cfx" role="main">
			<h1>SIIA KIRJUTA PEALKIRI</h1>
				<!-- <h1>{% contentblock name="slogan" %}{{ "title_goes_here" | lc }}{% endcontentblock %}</h1> -->
			<p>Tere tulemast Edicy'd kasutama — see on sinu leht koos vaiketekstidega. Need tekstid annavad sulle aimu, kuidas lehele oma sisu saad tuua. Kustuta vaikesisu julgelt ning loo selle asemele sind ennast või su ettevõtet tutvustav tekst.</p>
			<p>Oma lehe välimust saad muuta, kui klõpsid akna allservas asetseval Kujunduste nupul. Muudatusi, mis puudutavad su veebilehte (nt. veebiaadress ja keel), saad seadistada Kodulehe vaate alt.</p>
			<p>Edicy on täielikult sinu vajadustele kohandatav, mis tähendab, et saad lisada, kustutada ja muuta ükskõik millist teksti või pilti.</p>
				<!-- {% content %} -->
		</main>

		<?php require("components/site-footer.php") ?>
			<!-- {% include "site-footer" %} -->

	</section>
	<script>project.initCommonPage();</script>
</body>
</html>