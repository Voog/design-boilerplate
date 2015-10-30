<header class="site-header">
  <div class="header-top">
    {% include "menu-level-1" %}

    <div class="site-options">
      {% include "site-search" %}
      {% include "menu-language" %}
    </div>
  </div>

  {% unless blog %}
    <div class="header-bottom">
      {% include "menu-level-2" %}
    </div>
  {% endunless %}
</header>
