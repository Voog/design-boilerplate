<!DOCTYPE html>
<html lang="et" class="fp-html">
<head>
  {% include "html-head" %}
</head>
<body class="langing-page">
<!--<body style="background: url('{{ photos_path }}/fp-body-bg.jpg') center center no-repeat fixed;">-->

	<section class="fp-page-wrap">
    {% include "lang-menu" %}
		<div class="fp-align-middle">
			<header class="fp-header">
				<h1>Paesaggio Toscano</h1>
        {% include "main-menu" %}
			</header>
		</div>
	</section>
	
  {% include "footer" %}
  {% include "javascripts" %}
  <script>$.backstretch("{{ photos_path }}/fp-body-bg.jpg");</script>
</body>
</html>