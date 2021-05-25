{%- assign add_product_label = 'add_product' | lce -%}
{%- assign add_product_title = 'add_product_page' | lce -%}
<li class="edit-btn">
  {%- if _menuItem.layout_title == product_list_layout -%}
    {%- menuadd parent=_menuItem label=add_product_label title=add_product_title layout_title=product_layout -%}
  {%- else -%}
    {%- menuadd parent=_menuItem -%}
  {%- endif -%}
</li>