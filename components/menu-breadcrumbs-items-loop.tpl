{% if site.root_item.layout_title == product_list_layout %}
  {% assign page_lvl = 0 %}
{% else %}
  {% assign page_lvl = 1 %}
{% endif %}

{% for i in (1..5) %}
  {% assign level_str = 'menuitems_with_hidden_on_level_' | append: i %}
  {% for item in site[level_str] %}
    {% if item.selected? and page.level > page_lvl %}
      <span class="menu-separator">/</span>
      {% menulink item wrapper-tag="li" wrapper-class="menu-item" %}
    {% endif %}
  {% endfor %}
{% endfor %}
