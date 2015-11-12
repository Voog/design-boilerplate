{% comment %}
================================================================================
TEMPLATE TOOLS RELATED JAVASCRIPT.
Adds template specific JS tools. For example:
* Custom data saving
* Background pickers
* Image drop areas
================================================================================
{% endcomment %}
{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>

  <script>
    //==========================================================================
    // Sets the variable for saving global custom data.
    //==========================================================================
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    //==========================================================================
    // Initiates the language flags state toggleing.
    // By default this template uses the simple text listing version of the
    // language menu and popover menu with flags is disabled. Follow the
    // instructions in "components/site-header.tpl" to enable language menu
    // popover with flags.
    //==========================================================================
    /*
      site.bindLanguageFlagsToggle();
    */
  </script>
{% endeditorjsblock %}
