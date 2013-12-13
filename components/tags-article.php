<nav class="post-tags">
  {% if editmode %}
    {% editable article.tags %}
  {% else %}
  <h3>{% case page.language_code %}{% when 'et' %}Teemad{% else %}Topics{% endcase %}</h3>
  <ul class="menu horizontal tags-menu">
    <li><a href="/{{ site.blogs.first.page.path }}">{% case page.language_code %}{% when 'et' %}Kõik teemad {% else %}All topics{% endcase %}</a></li>
    {% for tag in article.tags %}
      <li><a href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">, {{ tag.name }}</a></li>
    {% endfor %}
  </ul>
  {% endif %}
</nav>