<!-- TODO: Add proper translations -->
<!-- Add languages and translations in alphabetical order -->
{% case page.language_code %}
  <!-- Danish -->
  {% when 'da' %}
    {% assign tags_all_blog = 'Alle indlæg' %}
    {% assign tags_all_post = 'Alle mærker' %}
  <!-- German -->
  {% when 'de' %}
    {% assign tags_all_blog = 'Alle Beiträge' %}
    {% assign tags_all_post = 'Alle tags' %}
  <!-- Estonian -->
  {% when 'et' %}
    {% assign tags_all_blog = 'Kõik postitused' %}
    {% assign tags_all_post = 'Kõik sildid' %}
  <!-- Finnish -->
  {% when 'fi' %}
    {% assign tags_all_blog = 'Kaikki viestit' %}
    {% assign tags_all_post = 'Kaikki tagit' %}
  <!-- Latvian -->
  {% when 'lv' %}
    {% assign tags_all_blog = 'Visas ziņas' %}
    {% assign tags_all_post = 'Visi tagi' %}
  <!-- Dutch -->
  {% when 'nl' %}
    {% assign tags_all_blog = 'Alle berichten' %}
    {% assign tags_all_post = 'Alle tags' %}
  <!-- Portuguese -->
  {% when 'pt' %}
    {% assign tags_all_blog = 'Todos os posts' %}
    {% assign tags_all_post = 'Todas as tags' %}
  <!-- Russian -->
  {% when 'ru' %}
    {% assign tags_all_blog = 'Все сообщения' %}
    {% assign tags_all_post = 'Все теги' %}
  <!-- Every other language -->
  {% else %}
    {% assign tags_all_blog = 'All posts' %}
    {% assign tags_all_post = 'All tags' %}
{% endcase %}
