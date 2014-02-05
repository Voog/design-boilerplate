<header class="site-header">
  <section class="header-left">
    <h1 class="mobile-site-title">{% editable site.header %}</h1>
    <button class="menu-btn js-menu-toggle">
      <div class="btn-inner">
        <div class="menu-stripe"></div>
        <div class="menu-stripe"></div>
        <div class="menu-stripe"></div>
      </div>
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