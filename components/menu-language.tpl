{% comment %}SIMPLE LANGUAGE NAVIGATION MENU WITH LANGUAGE TITLES{% endcomment %}
<nav class="menu-language">
  <ul class="menu menu-horizontal menu-public">
    {% for language in site.languages %}
      <li{% if language.selected? %} class="selected current" %}{% endif %}>
        <a href="{{ language.url }}">{{ language.title }}</a>
      </li>
    {% endfor %}
  </ul>

  {% if editmode %}
    <ul class="menu menu-horizontal menu-cms">
      {% if editmode %}
        <li>{% languageadd %}</li>
      {% endif %}
    </ul>
  {% endif %}
</nav>

