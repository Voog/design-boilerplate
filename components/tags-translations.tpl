<!-- TODO: Add proper translations -->
<!-- Add languages and translations in alphabetical order -->
{% case page.language_code %}
  {% when "da" %}
    {% assign tags_all = "Alle indlæg" %}
  {% when "de" %}
    {% assign tags_all = "Alle Beiträge" %}
  {% when "et" %}
    {% assign tags_all = "Kõik postitused" %}
  {% when "fi" %}
    {% assign tags_all = "kaikki viestit" %}
  {% when "lv" %}
    {% assign tags_all = "visas ziņas" %}
  {% when "nl" %}
    {% assign tags_all = "Alle berichten" %}
  {% when "pt" %}
    {% assign tags_all = "Todos os posts" %}
  {% when "ru" %}
    {% assign tags_all = "Все сообщения" %}
  {% else %}
    {% assign tags_all = "All posts" %}
{% endcase %}
