<nav class="menu-sub">
  <ul class="menu">
    {% for subitem in item.visible_children %}
      <li{% if subitem.selected? %} class="is-active"{% endif %}{% unless subitem.translated? %} class="is-untranslated fci-editor-menuadd"{% endunless %}>
        <a href="{{ subitem.url }}">{{ subitem.title }}</a>
      </li>
    {% endfor %}

    {% if editmode %}
      {% if item.hidden_children.size > 0 %}
        <li>{% menubtn subitem.hidden_children %}</li>
      {% endif %}
      <li>{% menuadd parent="item" %}</li>
    {% endif %}
  </ul>
</nav>
