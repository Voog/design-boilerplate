<ul class="menu">
  <li class="menu-item"><a class="menu-link{% if site.root_item.selected? %} active{% endif %}" href="{{ site.root_item.url }}">{{ site.root_item.title }}</a></li>
  {% for item in site.visible_menuitems %}
    <li class="menu-item"><a class="menu-link{% if item.selected? %} active{% endif %}{% unless item.translated? %} untranslated fci-editor-menuadd{% endunless %}" href="{{ item.url }}">{{ item.title }}</a></li>
    {% comment %}
      <!-- Uncomment if you want to include the sub menu to the main menu -->
      {% if item.children? %}
        <div class="menu-sub">
          <ul class="menu">
            {% for subitem in item.visible_children %}
              <li class="menu-item">
                <a class="menu-link{% if subitem.selected? %} active{% endif %}{% unless subitem.translated? %} untranslated fci-editor-menuadd{% endunless %}" href="{{ subitem.url }}">{{ subitem.title }}</a>
              </li>
            {% endfor %}

            {% if item.hidden_children.size > 0 %}<li class="edit-btn">{% menubtn item.hidden_children %}</li>{% endif %}
            {% if editmode %}<li class="edit-btn">{% menuadd parent="item" %}</li>{% endif %}
          </ul>
        </div>
      {% endif %}
    {% endcomment %}
  {% endfor %}
  {% if editmode %}
    {% if site.hidden_menuitems.size > 0 %}
      <li class="edit-btn">{% menubtn site.hidden_menuitems %}</li>
    {% endif %}
    {% if editmode %}<li class="edit-btn">{% menuadd %}</li>{% endif %}
  {% endif %}
</ul>
