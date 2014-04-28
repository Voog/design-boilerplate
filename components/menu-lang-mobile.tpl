<ul class="menu">
  {% for language in site.languages %}
    <li><a class="{{ language.code }}{% if language.selected? %} active{% endif %}" href="{{ language.url }}">{{ language.title }}</a></li>
  {% endfor %}
  {% if editmode %}<li class="edit-btn">{% languageadd %}</li>{% endif %}
</ul>
