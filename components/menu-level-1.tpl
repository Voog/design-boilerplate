<nav class="menu-main">
  <ul class="menu menu-horizontal menu-public menu-level-1">
    {% unless site.root_item.hidden? %}
      {% menulink site.root_item wrapper-tag="li" %}
    {% endunless %}

    {% for level_1 in site.visible_menuitems %}
      {% menulink level_1 wrapper-tag="li" %}
    {% endfor %}
  </ul>

  {% if editmode %}
    <ul class="menu menu-horizontal menu-cms">
      {% if site.hidden_menuitems.size > 0 %}
        <li>{% menubtn site.hidden_menuitems %}</li>
      {% endif %}

      <li>{% menuadd %}</li>
    </ul>
  {% endif %}
</nav>
