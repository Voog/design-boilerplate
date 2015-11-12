{% comment %}Site search settings are located in "sources/javascript/base.js" file –> "bindSiteSearch" function.{% endcomment %}
{% if site.search.enabled %}
  <div class="site-search">
    <form class="search-form js-search-form" method="get">
      <input class="search-input" type="search" placeholder="{{ 'search' | lc }}...">
      <input class="search-submit" type="submit" value="{{ "search" | lc }}">
    </form>

    {% comment %}Uncomment the following div if search container is set to use custom search container.{% endcomment %}
    {% comment %}("bindSiteSearch" function's option "resultsContainer" in "sources/javascripts/base.js" file.){% endcomment %}
    {% comment %}<div class="custom-search-container"></div>{% endcomment %}
  </div>
{% endif %}
