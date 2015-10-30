<nav class="menu-sub">
  {% for level_1 in site.visible_menuitems %}
    {% if level_1.selected? and level_1.children? or editmode %}
      <ul class="menu menu-horizontal menu-public menu-level-2">
          {% for level_2 in level_1.visible_children %}
            {% menulink level_2 wrapper-tag="li" %}
          {% endfor %}
      </ul>

      {% if editmode %}
        <ul class="menu menu-horizontal menu-cms">
          {% if level_1.hidden_children.size > 0 %}
            <li>{% menubtn subitem.hidden_children %}</li>
          {% endif %}

          <li>{% menuadd parent="level_1" %}</li>
        </ul>
      {% endif %}
    {% endif %}
  {% endfor %}
</nav>
