<header class="site-header">
  <div class="header-top">
    {% include 'menu-main' %}

    <div class="site-options">
      {% include 'site-search' %}
      {% include 'menu-language' %}
    </div>
  </div>

  {% unless blog %}
    {% for item in site.visible_menuitems %}
      {% if item.selected? and item.children? or editmode %}
        <div class="header-bottom">
          {% include 'menu-sub' %}
        </div>
      {% endif %}
    {% endfor %}
  {% endunless %}
</header>
