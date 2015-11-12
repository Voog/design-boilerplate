<nav class="menu-language menu-popover js-menu-language-popover js-prevent-sideclick">
  <ul class="menu menu-vertical menu-public">
    {% for language in site.languages %}
      <li{% if language.selected? %} class="selected current"{% endif %}>
        <a class="ico-flags ico-flag-{{ language.code }}" href="{{ language.url }}">{{ language.title }}</a>
      </li>
    {% endfor %}
  </ul>

  {% if editmode %}
    <ul class="menu menu-vertical menu-cms">
      {% if editmode %}
        <li>{% languageadd %}</li>
      {% endif %}
    </ul>

    <ul class="menu menu-vertical menu-options">
      <li>
        <button class="js-toggle-language-flags">
          <span class="language-flags-enable">{{ "enable_lang_flags" | lc }}</span>
          <span class="language-flags-disable">{{ "disable_lang_flags" | lc }}</span>
        </button>
      </li>
    </ul>
  {% endif %}
</nav>
