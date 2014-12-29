<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "bg-picker-variables" %}
  {% include "html-head" %}
  {% include "bg-picker-styles" %}
</head>

<body class="front-page">
  {% if editmode %}<button class="bgpicker-btn js-body-background-settings" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>{% endif %}
  {% if body_bg_image != '' or editmode %}<div class="body-background-image js-body-background-image"></div>{% endif %}
  {% if body_bg_color != '' or editmode %}<div class="body-background-color js-body-background-color"></div>{% endif %}

  <div class="container">
    {% include "header" %}
    {% include "menu-level-2" %}

    <main class="content" role="main" data-search-indexing-allowed="true">
      <header class="content-header">
        {% if editmode or site.header.size > 0 %}<div class="content-title content-formatted">{% editable site.header %}</div>{% endif %}

        {% capture content_slogan_html %}{% unless editmode %}{% content name="slogan" %}{% endunless %}{% endcapture %}
        <div class="content-slogan content-formatted js-content-optional">{% content name="slogan" %}</div>
      </header>

      <section class="content-body content-formatted">{% content %}</section>
    </main>

    {% include "footer" %}

  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}
  <script>site.initFrontPage();</script>
</body>
</html>
