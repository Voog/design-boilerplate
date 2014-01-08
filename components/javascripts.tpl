<script src="javascripts/jquery-1.10.2.min.js?2"></script>
<script src="javascripts/main.js?2"></script>

<!-- REPLACE IMAGES WITH RETINA READY DUPLICATES -->
<script type="text/javascript" src="{{ javascripts_path }}/retina.js?2"></script>

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
<script type="text/javascript">
  $(function() {  
    $('.lang-select').change(function() { window.location = $(this).find(':selected').val(); });
  });
</script>

<!-- EDICY GOOGLE ANALYTICS SHORTCODE -->
{% unless editmode %}{{ site.analytics }}{% endunless %}