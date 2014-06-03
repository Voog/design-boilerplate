<!-- SITE WIDE JAVASCRIPTS -->
<script src="{{ javascripts_path }}/jquery.js?22"></script>
<script src="{{ javascripts_path }}/main.js?22"></script>
<script src="{{ javascripts_path }}/backstretch.js?22"></script>
<script src="{{ javascripts_path }}/retina.js?22"></script>
<script src="{{ javascripts_path }}/overthrow.js?22"></script>

<!-- SITE SEARCH INITIATION -->
{% if site.search.enabled %}
  <script src="http://static.edicy.com/assets/site_search/3.0/site_search.js?22"></script>
  <script>
    var edys_site_search_options = {
      texts: { noresults: "{{ "search_noresults" | lc }}" },
      default_stylesheet_enabled: false
    }
  </script>
{% endif %}

<!-- GOOGLE ANALYTICS INITIATION -->
{% unless editmode %}{{ site.analytics }}{% endunless %}
