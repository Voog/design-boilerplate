<!DOCTYPE html>
<html lang="et">
<head>
  {% include "html-head" %}
</head>
<body>
<!--<body style="background: url('{{ photos_path }}/bp-body-bg.jpg') center center no-repeat; background-attachment: fixed;">-->
	<div class="cp-page-wrap cfx">
	  {% include "top-bar" %}
		<div class="cp-align-middle cfx">
			<div class="cp-inner cfx">
        {% include "header" %}
				<section class="page-content" role="main">
					<article class="post-content-wrap cfx">
						<h1 class="post-title">
							<span>{% editable article.title %}</span>
							<time datetime="{{ article.created_at | date : "%Y-%m-%d" }}" class="post-date">{{ article.created_at | date : "%b %d, %Y" }}</time>
						</h1>
						<div class="post-comments-count"><a href="#comments-area">{% case article.comments_count %}{% when 0 %}{{"no_comments"|lc}}{% else %}{{"comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{article.comments_count}}</span>{% endcase %}</a></div>
						<div class="post-excerpt">{% editable article.excerpt %}</div>
						<div class="post-content">{% editable article.body %}</div>
            {% include "tags-article" %}
					</article>
					{% unless editmode %}{% include "comments" %}{% endunless %}
				</section>
			</div>
			{% include "footer" %}
		</div>
	</div>
  {% include "javascripts" %}
  <script>
    $(document).ready(function() {
      if ($('#add-comment-wrap').hasClass('form_with_errors') === true) {
        $("html, body").scrollTop($('#add-comment-wrap').offset().top);
      }
    });
  </script>
  <script>$.backstretch("{{ photos_path }}/bp-body-bg.jpg");</script>
</body>
</html>