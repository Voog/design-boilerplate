{% if editmode or site.has_many_languages? %}
  <nav class="lang-menu">
    <select class="lang-select">
      {% for language in site.languages %}
        <option value="{{language.url}}" {% if language.selected? %}selected="selected"{% endif %}>{{language.title}}</option>
      {% endfor %}
    </select>
    {% if editmode %}{% languageadd %}{% endif %}
  </nav>
{% endif %}