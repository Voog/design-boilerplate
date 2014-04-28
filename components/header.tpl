<header class="header">
  <section class="header-left">
    <div class="header-title content-formatted">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{{ site.header }}{% unless editmode %}</a>{% endunless %}</div>

    <button class="menu-btn js-menu-btn">
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
    </button>

    <nav class="menu-main js-menu-main">
      {% include "menu-level-1" %}
      {% if editmode or site.has_many_languages? %}
      <div class="menu-lang">
          {% include "menu-lang-mobile" %}
        </div>
      {% endif %}
    </nav>
  </section>

  <section class="header-right">
    {% include "search" %}

    {% if editmode or site.has_many_languages? %}
      <nav class="menu-lang">
        {% include "menu-lang" %}
      </nav>
    {% endif %}
  </section>
</header>
