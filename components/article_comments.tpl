<section class="article-comments content-formatted">
  <h2 class="comments-title">{{ 'post_has_replies' | lcc : article.comments_count }}</h2>

  {% if article.comments_count > 0 %}
    {% for comment in article.comments %}
      <article class="comment edy-site-blog-comment">
        <div class="comment-body">{{ comment.body_html }}</div>
        <div class="comment-author">{{ comment.author }}</div>
        <div class="comment-date">{{ comment.created_at | format_date: "long" }}{% removebutton %}</div>
      </article>
    {% endfor %}
  {% endif %}
</section>
