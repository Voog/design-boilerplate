{% if site.has_language_tags? %}
  <nav class="menu-tags">
    <ul class="menu">
      <li>
        <a class="js-tags-all" href="{{ site.url }}{{ site.blogs.first.page.path }}">{% case page.language_code %}{% when 'et' %}Kõik teemad{% else %}All topics{% endcase %}</a>
      </li>
      {% for tag in site.language_tags %}
        {% assign activestr = " " %}
        {% for tmptag in tags %}
          {% if tmptag.name == tag.name %}
            {% assign activestr = 'class="active"' %}
          {% endif %}
        {% endfor %}
        <li>
          <a {{ activestr }} href="{{ site.url }}{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
        </li>
      {% endfor %}
    </ul>
  </nav>
{% endif %}
