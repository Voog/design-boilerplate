<nav class="menu-main">
  <ul class="menu">
    {% unless site.root_item.hidden? %}
      <li {% if site.root_item.selected? %} class="is-active"{% endif %}>
        <a href="{{ site.root_item.url }}">{{ site.root_item.title }}</a>
      </li>
    {% endunless %}

    {% for item in site.visible_menuitems %}
      <li{% if item.selected? %} class="is-active"{% endif %}{% unless item.translated? %} class="is-untranslated fci-editor-menuadd"{% endunless %}>
        {% menulink item %}
      </li>
    {% endfor %}

    {% if editmode %}
      {% if site.hidden_menuitems.size > 0 %}
        <li>{% menubtn site.hidden_menuitems %}</li>
      {% endif %}

      <li>{% menuadd %}</li>
    {% endif %}
  </ul>
</nav>
