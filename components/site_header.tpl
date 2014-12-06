<header class="site-header">
  <div class="header-left">
    <h1 class="header-title">
      <a href="{{ site.url }}">{{ page.site_title }}</a>
    </h1>
    <div class="header-slogan content-formatted">{% xcontent name="slogan" %}</div>
  </div>

  {% include "menu-main" %}

  <div class="social-icons">
    <a class="link-social" href="https://twitter.com/StigoPlanet" target="_twitter"><img class="socialicon" alt="Twitter" src="{{ images_path }}/ico-twitter.gif"></a>
    <a class="link-social" href="https://www.facebook.com/Stigobike" target="_facebook"><img class="socialicon facebook" alt="Facebook" src="{{ images_path }}/ico-facebook.gif"></a>
  </div>
</header>
