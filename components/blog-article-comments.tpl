<section id="article-comments" class="article-comments content-area">
  <h2 class="comments-title">{{ "post_has_replies" | lcc: article.comments_count }}</h2>

  {% if article.comments_count > 0 %}
    {% for comment in article.comments %}
      <article class="comment edy-site-blog-comment">
        <span class="comment-body">{{ comment.body_html }}</span>
        <span class="comment-author">({{ comment.author }}</span>
        <span class="comment-date">{{ comment.created_at | format_date: "long" }})</span>
        <span class="comment-delete">{% removebutton %}</span>
      </article>
    {% endfor %}
  {% endif %}

  <div class="comment-form{% unless comment.valid? %} form_with_errors{% endunless %}">
    {% commentform %}
      {% unless comment.valid? %}
          {% for error in comment.errors %}
            {% if error == "comment_author_blank" %}{% assign comment_name_error = true %}{% endif %}
            {% if error == "comment_email_blank" %}{% assign comment_email_error = true %}{% endif %}
            {% if error == "comment_body_blank" %}{% assign comment_body_error = true %}{% endif %}
          {%endfor %}
      {% endunless %}

      <div class="form_area">
        <div class="form_fields">
          <div class="form_field">
            <label for="comment-name">{{ "name" | lc }}{% if comment_name_error %} – <span class="form_field_error">{{ "comment_author_blank" | lc }}</span>{% endif %}</label>
            <input id="comment-name" class="form_field_textfield form_field_size_medium" name="comment[author]" value="{{ comment.author }}">
          </div>

          <div class="form_field">
            <label for="comment-email">{{ "email" | lc }}{% if comment_email_error %} – <span class="form_field_error">{{ "comment_email_blank" | lc }}</span>{% endif %}</label>
            <input id="comment-email" class="form_field_textfield form_field_size_medium" name="comment[author_email]" value="{{ comment.author_email }}">
          </div>

          <div class="form_field">
            <label for="comment-body">{{ "comment" | lc }}{% if comment_body_error %} – <span class="form_field_error">{{ "comment_body_blank" | lc }}</span>{% endif %}</label>
            <textarea id="comment-body" class="form_field_textarea form_field_size_large" name="comment[body]" rows="5">{{ comment.body }}</textarea>
          </div>
        </div>

        <div class="form_submit">
          <input type="submit" value="{{ "submit" | lc }}">
        </div>
      </div>
    {% endcommentform %}
  </div>
</section>
