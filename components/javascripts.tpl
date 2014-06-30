{% comment %}<!-- SITE WIDE JAVASCRIPTS -->{% endcomment %}
<script src="{{ javascripts_path }}/jquery.js?23"></script>
<script src="{{ javascripts_path }}/main.js?23"></script>
<script src="{{ javascripts_path }}/backstretch.js?23"></script>
<script src="{{ javascripts_path }}/overthrow.js?23"></script>
<script src="{{ site.static_asset_host }}/libs/picturefill/1.0.0/picturefill.min.js?23"></script>

{% if site.search.enabled %}
<script src="{{ site.static_asset_host }}/libs/edicy-search/1.0.0/edicy-search.js?2"></script>
<script>
  var search = new VoogSearch($('.js-search-form').get(0), {
    per_page: 2,
    lang: '{{ page.language_code }}'
  });
</script>
{% endif %}

{% comment %}<!-- GOOGLE ANALYTICS INITIATION -->{% endcomment %}
{% unless editmode %}{{ site.analytics }}{% endunless %}
