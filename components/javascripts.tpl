{% comment %}<!-- SITE WIDE JAVASCRIPTS -->{% endcomment %}
<script src="{{ javascripts_path }}/application.min.js"></script>
<script src="{{ site.static_asset_host }}/libs/picturefill/1.0.0/picturefill.min.js"></script>

{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/1.0.0/edicy-search.js"></script>
  <script>
    var search = new VoogSearch($('.js-search-form').get(0), {
      per_page: 3,
      lang: '{{ page.language_code }}',
      resultsContainer: $('.js-voog-search-modal-inner').get(0),
      sideclick: true,
      mobileModeWidth: 480,
      updateOnKeypress: false
    });
  </script>
{% endif %}

{% comment %}<!-- GOOGLE ANALYTICS INITIATION -->{% endcomment %}
{% unless editmode %}{{ site.analytics }}{% endunless %}
