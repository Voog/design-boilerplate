<style>
  {% comment %}/* BODY BACKGROUND */{% endcomment %}
  {% comment %}/* Body background image styles */{% endcomment %}
  {% if body_bg.imageSizes != nil %}
    {% if body_bg.imageSizes == "" %}
      .background-image {
        background-image: none;
      }
    {% else %}
      {% if product_page == true %}
        {% assign imageSizes = site.data[body_bg_key].imageSizes %}
      {% else %}
        {% assign imageSizes = page.data.body_bg.imageSizes %}
      {% endif %}

      {% for imageSize in imageSizes %}
        {% if forloop.first %}
          .background-image {
            background-image: url("{{ imageSize.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) {
            .background-image {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}

  {% else %}

    {% comment %}
    /* ADD THE IMAGES YOU WOULD LIKE TO USE AS DEFAULT BACKGROUND */
    /*
      {% if front_page %}
        {% assign bg_image_prefix = images_path | append: "/front-header-bg" %}
      {% elsif blog_article_page %}
        {% assign bg_image_prefix = images_path | append: "/article-header-bg" %}
      {% else %}
        {% assign bg_image_prefix = images_path | append: "/page-header-bg" %}
      {% endif %}

      .background-image {
        background-image: url("{{ bg_image_prefix }}.jpg");
      }

      @media screen and (max-width: 2048px) {
        .background-image {
          background-image: url("{{ bg_image_prefix }}_huge.jpg");
        }
      }

      @media screen and (max-width: 1280px) {
        .background-image {
          background-image: url("{{ bg_image_prefix }}_large.jpg");
        }
      }
    */
    {% endcomment %}
  {% endif %}

  {% comment %}/* Body background color style */{% endcomment %}
  body > .background-color {
    background-color: {{ body_bg_color }};
  }

  {% comment %}/* Container background color style */{% endcomment %}
  .container .background-color {
    background-color: {{ container_bg_color }};
  }
</style>
