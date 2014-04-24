<ul class="menu">
  <li><a {% if site.root_item.selected? %} class="active"{% endif %} href="{{ site.root_item.url }}">{{ site.root_item.title }}</a></li>
  {% for item in site.visible_menuitems %}
    <li><a{% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %} href="{{ item.url }}">{{ item.title }}</a></li>
  {% endfor %}
  {% if editmode %}
    {% if site.hidden_menuitems.size > 0 %}
      <li>{% menubtn site.hidden_menuitems %}</li>
    {% endif %}
    {% if editmode %}<li class="add-btn">{% menuadd %}</li>{% endif %}
  {% endif %}
</ul>
