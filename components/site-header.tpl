<header class="site-header">
  <div class="header-top">
    {% include "menu-level-1" %}

    <div class="site-options">
      {% include "site-search" %}
      {% comment %}Simple language menu with titles only.{% endcomment %}
      {% include "menu-language" %}

      {% comment %}
        Language popover menu with flags.
        Follow the steps below to switch to popover menu with flag icons.
        * Comment out the {% include "menu-language" %} component above these instructions.
        * Comment out the first ".menu-language" style in "sourdes/stylesheets/_menu-language.scss".
        * Uncomment everything under the title "Language menu with flags" in the "sourdes/stylesheets/_menu-language.scss".
        * Uncomment the <button> element under these instructions.
        * Uncomment language menu popover component at the end of "components/site-footer.tpl".
        * Uncomment the following in the "sources/javascripts/base.js":
          * $('.js-toggle-menu-language') button click event in bindButtonClicks function.
          * "handleMenuLanguagePopoverPositioning" function.
          * "bindLanguageFlagsToggle" function.
          * "bindLanguageFlagsToggle: bindLanguageFlagsToggle" line in "window.site" variable.
      {% endcomment %}

      {% comment %}<button class="menu-language-btn ico-flags ico-flag-{{ page.language_code }} js-toggle-menu-language js-prevent-sideclick">{{ current_language_title }}</button>{% endcomment %}
    </div>
  </div>

  {% unless blog %}
    <div class="header-bottom">
      {% include "menu-level-2" %}
    </div>
  {% endunless %}
</header>
