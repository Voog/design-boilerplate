<nav class="tags cfx">
  <ul class="menu tags-menu">
    {% if article.tags? %}
      <div class="filters-label">Filter posts</div>
    {% endif %}

    {% if editmode %}
      {% editable article.tags %}
    {% else %}
      <ul class="menu menu-horizontal tag-menu">
        <li><a href="/{{ site.blogs.first.page.path }}">{% case page.language_code %}{% when 'et' %}Kõik teemad{% else %}All topics{% endcase %}</a></li>
        {% for tag in article.tags %}
          <li><a href="/{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
        {% endfor %}
      </ul>
    {% endif %}
  </ul>
</nav>
