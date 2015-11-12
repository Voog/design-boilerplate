{% comment %}TEMPLATE TOOLS RELATED JAVASCRIPT.{% endcomment %}
{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    // Sets the variable for saving global custom data.
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    site.bindLanguageFlagsToggle();
  </script>
{% endeditorjsblock %}
