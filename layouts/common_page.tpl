<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "bg-picker-variables" %}
  {% include "html-head" %}
  {% include "bg-picker-styles" %}
</head>

<body class="common-page js-bg-picker-area">
  <div class="js-background-type {{ body_bg_type }}">
    {% if editmode %}
      <button class="voog-bg-picker-btn js-background-settings" data-bg-key="body_bg" data-bg-picture-boolean="true" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
    {% endif %}

    <div class="background-image js-background-image"></div>
    <div class="background-color js-background-color"></div>

    <div class="container">
      {% include "header" %}
      {% include "menu-level-2" %}

      <main class="content" role="main" data-search-indexing-allowed="true">
        <header class="content-header content-formatted">{% content name="slogan" %}</header>
        <section class="content-body content-formatted">{% content %}</section>
      </main>

      {% include "footer" %}

    </div>
  </div>

  {% include "javascripts" %}
  {% include "bg-picker" %}
  <script>site.initCommonPage();</script>
</body>
</html>
