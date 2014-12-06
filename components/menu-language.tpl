<nav class="menu-language">
  <ul class="menu">
    {% for language in site.languages %}
      <li{% if item.selected? %} class="is-active"{% endif %}>
        <a href="{{ language.url }}">{{ language.title }}</a>
      </li>
    {% endfor %}

    {% if editmode %}
      <li>{% languageadd %}</li>
    {% endif %}
  </ul>
</nav>
