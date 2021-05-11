<ul class="menu menu-horizontal menu-public menu-breadcrumbs">
  {% if site.root_item.layout_title == product_list_layout and show_product_related_pages_in_main_menu != true %}
    {% if page.level > 0 %}
      {% menulink site.root_item wrapper-tag="li" wrapper-class="menu-item" %}
    {% endif %}
  {% endif %}

  {% include "menu-breadcrumbs-items-loop" %}

  {% if site.root_item.selected? %}
    {% if editmode %}
      {% if site.root_item.untranslated_children.size > 0 %}
        <li class="menu-item menu-item-cms">{% menubtn site.root_item.untranslated_children %}</li>
      {% endif %}

      {% if site.root_item.hidden_children.size > 0 %}
        <li class="menu-item menu-item-cms">{% menubtn site.root_item.hidden_children %}</li>
      {% endif %}

      {% unless site.root_item.layout_title == product_layout %}
        {% include 'add-page-button', _menuItem: site.root_item %}
      {% endunless %}

      {% if site.root_item.selected? and site.root_item.layout_title == product_list_layout %}
        <li class="menu-item menu-item-cms float-right">
          <a class="js-root-item-settings-toggle"></a>
        </li>
      {% endif %}
    {% endif %}
  {% else %}
    {% include "menu-breadcrumbs-buttons-loop" %}
  {% endif %}
</ul>