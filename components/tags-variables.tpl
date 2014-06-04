<!-- TODO: Add proper translations -->
<!-- Add languages and translations in alphabetical order -->
{% case page.language_code %}
  <!-- Danish -->
  {% when 'da' %}
    {% assign tags_all = 'Alle indlæg' %}
    {% assign tags_title = 'Tags' %}
  <!-- German -->
  {% when 'de' %}
    {% assign tags_all = 'Alle Beiträge' %}
    {% assign tags_title = 'Schlagworte' %}
  <!-- Estonian -->
  {% when 'et' %}
    {% assign tags_all = 'Kõik postitused' %}
    {% assign tags_title = 'Sildid' %}
  <!-- Finnish -->
  {% when 'fi' %}
    {% assign tags_all = 'Kaikki viestit' %}
    {% assign tags_title = 'Tunnisteet' %}
  <!-- Latvian -->
  {% when 'lv' %}
    {% assign tags_all = 'Visas ziņas' %}
    {% assign tags_title = 'Tags' %}
  <!-- Dutch -->
  {% when 'nl' %}
    {% assign tags_all = 'Alle berichten' %}
    {% assign tags_title = 'Žymos' %}
  <!-- Portuguese -->
  {% when 'pt' %}
    {% assign tags_all = 'Todos os posts' %}
    {% assign tags_title = 'Marcações' %}
  <!-- Russian -->
  {% when 'ru' %}
    {% assign tags_all = 'Все сообщения' %}
    {% assign tags_title = 'Метки' %}
  <!-- Every other language -->
  {% else %}
    {% assign tags_all = 'All posts' %}
    {% assign tags_title = 'Tags' %}
{% endcase %}
