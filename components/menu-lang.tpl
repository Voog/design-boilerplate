<select class="menu">
  {% for language in site.languages %}
    <option value="{{ language.url }}" {% if language.selected? %}selected="selected"{% endif %}>{{ language.title }}</option>
  {% endfor %}
</select>
{% if editmode %}<div class="add-btn">{% languageadd %}</div>{% endif %}
