<div class="tags">
  {% include "tags-variables" %}
  {% if editmode %}
    <div class="tags-editor">{% editable article.tags %}</div>
  {% else %}
    {% unless article.tags == empty %}
      <nav class="menu-tags menu-sub">
        <ul class="menu">
          <li class="tags-title">{{ tags_title }}:</li>
          {% for tag in article.tags %}
            <li class="menu-item"><a class="menu-link" href="{{ site.url }}{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
          {% endfor %}
        </ul>
      </nav>
    {% endunless %}
  {% endif %}
</div>
