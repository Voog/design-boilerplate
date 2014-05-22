{% if site.has_language_tags? %}
  {% include "tags-translations" %}
  <nav class="menu-tags">
    <ul class="menu">
      <li class="menu-item">
        <a class="menu-link js-tags-all" href="{{ site.url }}{{ site.blogs.first.page.path }}">{{ tags_all }}</a>
      </li>
      {% for tag in site.language_tags %}
        {% assign activestr = "" %}
        {% for tmptag in tags %}
          {% if tmptag.name == tag.name %}
            {% assign activestr = " active" %}
          {% endif %}
        {% endfor %}
        <li class="menu-item">
          <a class="menu-link{{ activestr }}" href="{{ site.url }}{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
        </li>
      {% endfor %}
    </ul>
  </nav>
{% endif %}
