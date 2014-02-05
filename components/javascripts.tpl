<script src="{{ javascripts_path }}/jquery.js?1"></script>
<script src="{{ javascripts_path }}/main.js?1"></script>

<!-- REPLACE IMAGES WITH RETINA READY DUPLICATES -->
<script src="{{ javascripts_path }}/retina.js?1"></script>

<!-- EDICY SITE SEARCH PLUGIN -->
{% if site.search.enabled %}
  <script src="http://static.edicy.com/assets/site_search/3.0/site_search.js?2"></script>
  <script>
    var edys_site_search_options = {
      texts: { noresults: "{{ "search_noresults"|lc }}" },
      default_stylesheet_enabled: false
    }
  </script>
{% endif %}

<!-- LANGUAGE SWITCHER -->
<script>
  $(function() {  
    $('.lang-select').change(function() { window.location = $(this).find(':selected').val(); });
  });
</script>

<!-- EDICY GOOGLE ANALYTICS SHORTCODE -->
{% unless editmode %}{{ site.analytics }}{% endunless %}