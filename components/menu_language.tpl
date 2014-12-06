<nav class="menu-language">
  <ul class="menu">
    {% for language in site.languages %}
      <li class="lang-flag lang-flag-{{ language.code }}{% if language.selected? %} active{% endif %}">
        <a href="{{ language.url }}">{{ language.title }}</a>
      </li>
    {% endfor %}

    {% if editmode %}
      <li>{% languageadd %}</li>
    {% endif %}
  </ul>
</nav>
