{% for item in site.menuitems %}
  {% if item.selected? and item.children? or editmode %}
    <nav class="menu-sub">
      <ul class="menu">
        {% if editmode or item.children? %}
          <li class="menu-item">
            <a class="menu-link{% if item.current? %} active{% endif %}{% unless item.translated? %} fci-editor-menuadd{% endunless %}" href="{{ item.url }}">{{ item.title }}</a>
          </li>
          {% for subitem in item.visible_children %}
            {%- unless subitem.layout_title == product_list_layout or subitem.layout_title == product_layout -%}
              <li class="menu-item">
                <a class="menu-link{% if subitem.selected? %} active{% endif %}{% unless subitem.translated? %} untranslated fci-editor-menuadd{% endunless %}" href="{{ subitem.url }}">{{ subitem.title }}</a>
              </li>
            {%- endunless -%}
          {% endfor %}
        {% endif %}
        {% if item.hidden_children.size > 0 %}<li class="edit-btn">{% menubtn item.hidden_children %}</li>{% endif %}
        {% if editmode %}
          {%- menuadd parent=item -%}
        {% endif %}
      </ul>
    </nav>
  {% endif %}
{% endfor %}
