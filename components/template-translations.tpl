{% comment %}TEMPLATE TEXT TRANSLATIONS{% endcomment %}
{% comment %}Delete this component and remove the "include" tag from the "html_head" component if it there are no texts to translate.{% endcomment %}
{% comment %}Add languages and translations in alphabetical order{% endcomment %}
{% capture dont_render %}
  {% case page.language_code %}
    {% comment %}Danish{% endcomment %}
    {% when "da" %}
      {% assign hello_world = "Hej verden!" %}
    {% comment %}German{% endcomment %}
    {% when "de" %}
      {% assign hello_world = "Hallo welt!" %}
    {% comment %}Estonian{% endcomment %}
    {% when "et" %}
      {% assign hello_world = "Tere maailm!" %}
    {% comment %}Finnish{% endcomment %}
    {% when "fi" %}
      {% assign hello_world = "Moikka maailma!" %}
    {% comment %}Latvian{% endcomment %}
    {% when "lv" %}
      {% assign hello_world = "Sveika pasaule!" %}
    {% comment %}Dutch{% endcomment %}
    {% when "nl" %}
      {% assign hello_world = "Hallo wereld!" %}
    {% comment %}Portuguese{% endcomment %}
    {% when "pt" %}
      {% assign hello_world = "Olá Mundo!" %}
    {% comment %}Russian{% endcomment %}
    {% when "ru" %}
      {% assign hello_world = "Привет, мир!" %}
    {% comment %}Every other language{% endcomment %}
    {% else %}
      {% assign hello_world = "Hello world!" %}
  {% endcase %}
{% endcapture %}
