{% if site.search.enabled %}
  <div class="site-search">
    <form class="search-form" method="get" action="#">
      <input class="search-input" placeholder="{{ 'search' | lc }}...">
      <input class="search-submit" type="submit" value="{{ 'search' | lc }}">
    </form>

    <div class="voog-search-modal">
      <div class="voog-search-modal-inner js-voog-search-modal-inner"></div>
    </div>
  </div>
{% endif %}
