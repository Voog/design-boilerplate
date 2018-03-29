{% comment %}SITE WIDE JAVASCRIPTS{% endcomment %}
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script> 
<script src="{{ javascripts_path }}/application.js"></script>
{% sitejs_include %}

{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script>
    var search = new VoogSearch($('.js-search-form').get(0), {
      per_page: 3,
      lang: '{{ page.language_code }}',
      sideclick: true,
      mobileModeWidth: 480,
      updateOnKeypress: false
    });
  </script>
{% endif %}

{% comment %}GOOGLE ANALYTICS INITIATION{% endcomment %}
{% unless editmode %}{{ site.analytics }}{% endunless %}
