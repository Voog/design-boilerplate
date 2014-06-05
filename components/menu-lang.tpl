<!-- Use this code if you want a select type language menu -->
<select class="menu">
  {% for language in site.languages %}
    <option class="menu-item" value="{{ language.url }}" {% if language.selected? %}selected="selected"{% endif %}>{{ language.title }}</option>
  {% endfor %}
</select>
{% if editmode %}<div class="edit-btn">{% languageadd %}</div>{% endif %}

{% comment %}<!-- Use this code if you want a list type language menu -->{% endcomment %}
{% comment %}
<!--
<ul class="menu">
  {% for language in site.languages %}
    <li><a class="lang-flag lang-flag-{{ language.code }}{% if language.selected? %} active{% endif %}" href="{{ language.url }}">{{ language.title }}</a></li>
  {% endfor %}
  {% if editmode %}<li class="edit-btn">{% languageadd %}</li>{% endif %}
</ul>
-->
{% endcomment %}
