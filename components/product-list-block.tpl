<div class="product_list flex_row flex_row-3 mar_0-16-neg pad_40-0">
  {%- assign level_str = 'menuitems_on_level_' | append: page.level -%}
  {% if site.root_item.selected? %}
    {% for level_1 in site.visible_menuitems_with_data %}
      {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
      {% include 'product-list-block-item', _entityData: level_1 %}        
      {% endif %}
    {% endfor %}
  {% else %}
    {%- for item in site[level_str] -%}
      {%- if item.current? -%}
        {%- for item_child in item.visible_children_with_data -%}
          {%- if item_child.layout_title == product_list_layout or item_child.layout_title == product_layout -%}
            {% include 'product-list-block-item', _entityData: item_child %}
          {%- endif -%}
        {%- endfor -%}
      {%- endif -%}
    {%- endfor -%}
  {%- endif -%}
</div>

