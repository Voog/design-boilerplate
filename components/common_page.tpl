<!DOCTYPE html>
<html lang="et">
<head>
  {% include "html-head" %}
</head>
  <body>
  <!--<body style="background: url('{{ photos_path }}/cp-body-bg.jpg') center center no-repeat; background-attachment: fixed;">-->
	<div class="cp-page-wrap cfx">
	  {% include "top-bar" %}
		<div class="cp-align-middle cfx">
			<div class="cp-inner cfx">
        {% include "header" %}
				<main class="page-content cfx" role="main">
          {% content %}
				</main>
			</div>
			{% include "footer" %}
		</div>
	</div>
  {% include "javascripts" %}
  <script>$.backstretch("{{ photos_path }}/cp-body-bg.jpg");</script>
</body>
</html>