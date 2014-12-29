{% comment %} TODO: Optimize the logic.{% endcomment %}
{% capture dont_render %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% if bg-picker-variables == 'article' %}
    {% assign body_bg = article.data.body_bg %}
  {% else %}
    {% assign body_bg = page.data.body_bg %}
  {% endif %}

  {% assign body_bg_image = body_bg.image %}
  {% assign body_bg_image_sizes = body_bg.imageSizes %}
  {% assign body_bg_color = body_bg.color %}
  {% assign body_bg_color_data = body_bg.colorData %}

  {% comment %}Sets the body background color scheme.{% endcomment %}
  {% if body_bg %}
    {% if body_bg_color_data.a >= 0.5 %}
      {% if body_bg_color_data.lightness >= 0.5 %}
        {% assign body_bg_type = 'light-background' %}
      {% else %}
        {% assign body_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% assign body_bg_type = 'light-background' %}
    {% endif %}
  {% else %}
    {% assign body_bg_type = 'dark-background' %}
  {% endif %}

  {% unless body_bg_image_sizes == nil %}
    {% assign body_bg_image_sizes_str = body_bg_image_sizes | json %}
  {% endunless %}

  {% if body_bg_color_data == nil %}
    {% assign body_bg_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0.2, "lightness": 0}' %}
  {% else %}
    {% assign body_bg_color_data_str = body_bg_color_data | json %}
  {% endif %}
{% endcapture %}
