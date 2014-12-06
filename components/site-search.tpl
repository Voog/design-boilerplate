{% if site.search.enabled %}
  <div class="site-search">
    <form class="search-form" method="get" action="#">
      <input id="onpage_search" class="search-input js-search-input" type="text" name="" placeholder="{{ 'search' | lc }}...">
      <input class="search-submit" type="submit">
    </form>

    <div class="voog-search-modal">
      <div class="voog-search-modal-inner js-voog-search-modal-inner"></div>
    </div>
  </div>
{% endif %}
