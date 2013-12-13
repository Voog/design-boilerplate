<header class="site-header">
  <section class="site-header-left">
    <div class="header-logo cfx" role="banner">
        <div role="banner"><a href="{{ site.root_item.url }}">{% editable site.header %}</a></div>
    </div>
  </section>

  <section class="site-header-right">
    <section class="menu-btn">
      <div class="menu-stripe"></div>
      <div class="menu-stripe"></div>
      <div class="menu-stripe"></div>
    </section>

    <nav class="main-menu cfx" role="navigation">
      <ul class="menu horizontal">
        {% unless site.root_item.hidden? %}
          <li {% if site.root_item.selected? %} class="active"{% endif %}><a href="{{ site.root_item.url }}">{{ site.root_item.title }}</a></li>
        {% endunless %}
        {% for item in site.visible_menuitems %}
          <li {% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}><a href="{{ item.url }}" >{{ item.title }}</a></li>  
        {% endfor %}
        {% if editmode %}
          <li>{% menubtn site.hidden_menuitems %}</li>
          <li>{% menuadd %}</li>
        {% endif %}
      </ul>
    </nav>

    {% if site.search.enabled %}
      <section class="search-wrap">
        <form id="search" class="edys-search" role="search" method="get" action="#">
          <input id="onpage_search" class="edys-search-input" type="text" placeholder="Search" name="">
          <input class="search-submit" type="submit" value="" name="">
        </form>
        <div id="customsearch"></div>
      </section>
    {% endif %}

    {% if editmode %}
      <section class="lang-menu">
        {% for language in site.languages %}{% if language.selected? %}<button class="lang-btn {{ language.code }}">{{ language.title }}</button>{% endif %}{% endfor %}
        <nav class="lang-menu-popover">
          <ul class="menu">
            {% for language in site.languages %}
              <li {% if language.selected? %}class="active"{% endif %}><a href="{{ language.url }}" class="{{ language.code }}">{{ language.title }}</a></li>
            {% endfor %}
            <li>{% languageadd %}</li>
          </ul>
        </nav>
      </section>
    {% else %}
      {% if site.has_many_languages? %}
        <section class="lang-menu">
          {% for language in site.languages %}{% if language.selected? %}<button class="lang-btn {{ language.code }}">{{ language.title }}</button>{% endif %}{% endfor %}
          <nav class="lang-menu-popover">
            <ul class="menu">
              {% for language in site.languages %}
                <li {% if language.selected? %}class="active"{% endif %}><a href="{{ language.url }}" class="{{ language.code }}">{{ language.title }}</a></li>
              {% endfor %}
            </ul>
          </nav>
        </section>
      {% endif %}
    {% endif %}

  </section>
</header>