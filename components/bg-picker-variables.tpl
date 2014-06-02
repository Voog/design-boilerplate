{% capture dont_render %}
  {% if bg-picker-variables == "article" %}

    <!-- Sets the body background image value for article pages -->
    {% if article.data.body_image == nil %}
      {% assign body_image = '' %}
    {% else %}
      {% assign body_image = article.data.body_image %}
    {% endif %}

    <!-- Sets the body background color value for article pages-->
    {% if article.data.body_color == nil %}
      {% assign body_color = '' %}
    {% else %}
      {% assign body_color = article.data.body_color %}
    {% endif %}

    <!-- Builds style tag for background color for article pages -->
    {% assign body_color_style = '' %}
    {% unless article.data.body_color == nil %}
      {% assign body_color_style = ' style="background-color: ' %}
      {% if article.data.body_color == '' %}
        {% assign body_color_style = body_color_style | append: 'none' %}
      {% else %}
        {% assign body_color_style = body_color_style | append: article.data.body_color %}
        {% if article.data.body_image == '' %}
          {% assign body_color_style = body_color_style | append: '; opacity: 1' %}
        {% else %}
          {% assign body_color_style = body_color_style | append: '; opacity: 0.5' %}
        {% endif %}
      {% endif %}
      {% assign body_color_style = body_color_style | append: ';"' %}
    {% endunless %}

  {% else %}

    <!-- Sets the body background image value for content pages -->
    {% if page.data.body_image == nil %}
      {% assign body_image = '' %}
    {% else %}
      {% assign body_image = page.data.body_image %}
    {% endif %}

    <!-- Sets the body background color value -->
    {% if page.data.body_color == nil %}
      {% assign body_color = '' %}
    {% else %}
      {% assign body_color = page.data.body_color %}
    {% endif %}

    <!-- Builds style tag for background color for content pages -->
    {% assign body_color_style = "" %}
    {% unless page.data.body_color == nil %}
      {% assign body_color_style = ' style="background-color: ' %}
      {% if page.data.body_color == '' %}
        {% assign body_color_style = body_color_style | append: 'none' %}
      {% else %}
        {% assign body_color_style = body_color_style | append: page.data.body_color %}
        {% if page.data.body_image == '' %}
          {% assign body_color_style = body_color_style | append: '; opacity: 1' %}
        {% else %}
          {% assign body_color_style = body_color_style | append: '; opacity: 0.5' %}
        {% endif %}
      {% endif %}
      {% assign body_color_style = body_color_style | append: ';"' %}
    {% endunless %}

  {% endif %}
{% endcapture %}
