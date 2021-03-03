<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">

<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
</head>

<body class="product_list-page body-bg_picker--area">
  {% if editmode %}
  <button class="voog-bg-picker-btn js-background-settings" data-bg-key="body_bg" data-bg-picture-boolean="true"
    data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}"
    data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
  {% endif %}

  <div class="background-image js-background-image"></div>
  <div class="background-color js-background-color"></div>


  <div class="container js-bg-picker-area">
    <div class="js-background-type {{ container_bg_type }}">
      <div class="background-color js-background-color">
        {% if editmode %}
        <button class="voog-bg-picker-btn js-background-settings" data-bg-key="container_bg"
          data-bg-picture-boolean="false" data-bg-color="{{ container_bg_color }}"
          data-bg-color-data="{{ container_bg_color_data_str | escape }}"></button>
        {% endif %}

        {% include "header" %}
        {% include "menu-level-2" %}

        <main class="content" role="main" data-search-indexing-allowed="true">
          <section class="content-body content-formatted">{% content %}</section>
          {% include 'product-list-block' %}
        </main>

        {% include "footer" %}
      </div>
    </div>
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "template-tools" %}
</body>

</html>