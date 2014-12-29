<style>
  {% comment %}/* Body background image */{% endcomment %}
  {% if body_bg.imageSizes != nil %}
    {% if body_bg.imageSizes == "" %}
      .js-body-background-image {
        background-image: none;
      }
    {% else %}
      {% for imageSize in body_bg.imageSizes %}
        {% if forloop.first %}
          .js-body-background-image {
            background-image: url("{{ imageSize.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) {
            .js-body-background-image {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}
  {% endif %}

  {% comment %}/* Body Background color */{% endcomment %}
  {% if body_bg.color %}
    .js-body-background-color {
      background-color: {{ body_bg.color }};
    }
  {% endif %}
</style>
