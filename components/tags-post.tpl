<div class="tags">
  {% include "tags-variables" %}
  {% if editmode %}
    <div class="tags-editor">{% editable article.tags %}</div>
  {% else %}
    {% if article.tags.size > 0 %}
      <nav class="menu-tags">
        <ul class="menu">
          <li class="menu-item"><a class="menu-link" href="{{ site.url }}{{ site.blogs.first.page.path }}">{{ tags_all_post }}</a></li>
          {% for tag in article.tags %}
            <li class="menu-item"><a class="menu-link" href="{{ site.url }}{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
          {% endfor %}
        </ul>
      </nav>
    {% endif %}
  {% endif %}
</div>
