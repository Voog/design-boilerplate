<header class="header">
  <section class="header-left">
    <h1 class="header-title content-formatted cfx"><a href="{{ site.root_item.url }}">{{ site.header }}</a></h1>
    <button class="menu-btn js-menu-toggle">
      <span class="btn-inner"><span class="menu-stripe"></span><span class="menu-stripe"></span><span class="menu-stripe"></span></span>
    </button>

    <nav class="main-menu" role="navigation">
      {% include "nav-menu" %}
    </nav>
  </section>

  <section class="header-right">
    {% include "search" %}
    {% include "lang-menu" %}
  </section>
</header>