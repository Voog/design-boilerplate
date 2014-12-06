{% comment %}TEMPLATE TEXT TRANSLATIONS{% endcomment %}
{% comment %}Delete this component and remove the {% include %} tag from the 'html_head' component if it there are no texts to translate.{% endcomment %}
{% comment %}Add languages and translations in alphabetical order{% endcomment %}
{% case page.language_code %}
  <!-- Danish -->
  {% when 'da' %}
    {% assign hello_world = 'Hej verden!' %}
  <!-- German -->
  {% when 'de' %}
    {% assign hello_world = 'Hallo welt!' %}
  <!-- Estonian -->
  {% when 'et' %}
    {% assign hello_world = 'Tere maailm!' %}
  <!-- Finnish -->
  {% when 'fi' %}
    {% assign hello_world = 'Moikka maailma!' %}
  <!-- Latvian -->
  {% when 'lv' %}
    {% assign hello_world = 'Sveika pasaule!' %}
  <!-- Dutch -->
  {% when 'nl' %}
    {% assign hello_world = 'Hallo wereld!' %}
  <!-- Portuguese -->
  {% when 'pt' %}
    {% assign hello_world = 'Olá Mundo!' %}
  <!-- Russian -->
  {% when 'ru' %}
    {% assign hello_world = 'Привет, мир!' %}
  <!-- Every other language -->
  {% else %}
    {% assign hello_world = 'Hello world!' %}
{% endcase %}
