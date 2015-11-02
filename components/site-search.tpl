{% if site.search.enabled %}
  <div class="site-search">
    <form class="search-form js-search-form" method="get">
      <input class="search-input" type="search" placeholder="{{ 'search' | lc }}...">
      <input class="search-submit" type="submit" value="{{ "search" | lc }}">
    </form>
  </div>
{% endif %}
