<!DOCTYPE html>
<html lang="et">
<head>
  {% include "html-head" %}
</head>
  <body>
  <!--<body style="background: url('{{photos_path }}/bp-body-bg.jpg') center center no-repeat; background-attachment: fixed;">-->
	<div class="cp-page-wrap cfx">
	  {% include "top-bar" %}
		<div class="cp-align-middle cfx">
			<div class="cp-inner cfx">
        {% include "header" %}
				<section class="page-content common-page" role="main">
  			  {% addbutton %}
          {% for article in articles %}
  					<article class="post-excerpt-wrap">
  						<h1 class="post-title">
  							<a href="{{ article.url }}">{{ article.title }}</a>
  							<time datetime="{{ article.created_at | date : "%Y-%m-%d" }}" class="post-date">{{ article.created_at | date : "%b %d, %Y" }}</time>
  						</h1>
  						<div class="post-excerpt">{{ article.excerpt }}</div>
  					</article>
          {% endfor %}
				</section>
			</div>
			{% include "footer" %}
		</div>
	</div>
  {% include "javascripts" %}
  <script>$.backstretch("{{ photos_path }}/bp-body-bg.jpg");</script>
  <script>
    $(document).ready(function() {
      currentUrl = window.location.href;
      blogUrl = "{{ site.url }}/{{ page.path }}";
      if (currentUrl === blogUrl) {
        $(".blog-main a").addClass("active");
      };
    });
  </script>
</body>
</html>