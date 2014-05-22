<div class="tags">
  {% include "tags-translations" %}
  {% if editmode %}
    <div class="tags-editor">{% editable article.tags %}</div>
  {% else %}
    <nav class="menu-tags">
      <ul class="menu">
        <li class="menu-item"><a class="menu-link" href="{{ site.url }}{{ site.blogs.first.page.path }}">{{ tags_all }}</a></li>
        {% for tag in article.tags %}
          <li class="menu-item"><a class="menu-link" href="{{ site.url }}{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
        {% endfor %}
      </ul>
    </nav>
  {% endif %}
</div>
