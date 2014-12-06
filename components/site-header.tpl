<header class="site-header">
  <div class="header-top">
    {% include 'menu-main' %}

    <div class="inner-right">
      {% include 'menu-language' %}
      {% include 'site-search' %}
    </div>
  </div>

  {% for item in site.visible_menuitems %}
    {% if item.selected? and item.children? or editmode %}
    <div class="header-bottom">
      {% include 'menu-sub' %}
    </div>
  {% endif %}
{% endfor %}
</header>
