<!DOCTYPE html>
{%- assign product_page = true -%}
{%- include "template-settings" -%}
{%- include "template-variables" -%}

<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">

<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "template-styles" body_bg_key: template_settings.product.body_bg.key %}
</head>

{%- capture bottom_content_html -%}
  {%- unless editmode -%}
    {%- content bind=product name="content" -%}
  {%- endunless -%}
{%- endcapture -%}

{%- assign bottom_content_size = bottom_content_html | strip | size -%}

{%- capture gallery_content_html -%}
  {%- unless editmode -%}
    {%- content bind=product name="gallery" -%}
  {%- endunless -%}
{%- endcapture -%}

{%- assign gallery_content_size = gallery_content_html | strip | size -%}

<body class="product_page js-bg-picker-area">
  {% if editmode %}
    <button 
      class="voog-bg-picker-btn js-background-settings" 
      data-bg-key="{{ body_bg_key }}" 
      data-bg-picture-boolean="true"
      data-bg-image="{{ body_bg_image }}" 
      data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}"
      data-bg-color="{{ body_bg_color }}" 
      data-bg-color-data="{{ body_bg_color_data_str | escape }}">
    </button>
  {% endif %}

  <div class="background-image js-background-image"></div>
  <div class="background-color js-background-color"></div>

  <div class="container js-bg-picker-area">
    <div class="js-background-type {{ container_bg_type }}">
      <div class="background-color js-background-color">

        {% if editmode %}
          <button class="voog-bg-picker-btn js-background-settings" 
            data-bg-key="{{ container_bg_key }}"
            data-bg-picture-boolean="false" 
            data-bg-color="{{ container_bg_color }}"
            data-bg-color-data="{{ container_bg_color_data_str | escape }}">
          </button>
        {% endif %}

        {% include "header" %}

        <main class="content" role="main">

          {% include "menu-breadcrumbs-sd" %}

          <div class="flex_row flex_row-2 product-content" data-search-indexing-allowed="true">
            <div class="flex_row-2--item-60">
              <div class="mar_0-16 p-rel js-product-page-image-wrap">
                {%- if product.image != blank %}
                  {% assign item_image_state = "with-image" %}
                {% else %}
                  {% assign item_image_state = "without-image" %}
                {% endif -%}

                <div class="content-item-box {{ item_image_state }} js-content-item-box">
                  <div class="item-top product-image">
                    <div class="top-inner">
                      {%- if product.image != blank %}
                        {% image product.image loading: 'lazy' target_width: "600" class: "item-image not-cropped" %}
                      {% endif -%}
                    </div>
                  </div>
                </div>
              </div>

              {%- if gallery_content_size > 0 or editmode -%}
                <section class="mar_0-16 content-body content-formatted mar_t-32 js-product-gallery" data-search-indexing-allowed="true">
                  {% content bind=product name="gallery" %}
                </section>
              {% endif -%}
            </div>

            <div class="flex_row-2--item-40 js-product-content-right">
              <div class="mar_0-16 flex_col">
                <section class="content-body content-formatted" data-search-indexing-allowed="true">
                  <div class="content-item-title content-area">
                    <h1>{%- editable product.name -%}</h1>
                  </div>

                  <div class="product-price">
                    {%- if product.price_max_with_tax != product.price_min_with_tax -%}
                      {{ product.price_min_with_tax | money_with_currency: product.currency -}}
                      <span class="pad_0-4">–</span>
                    {%- endif -%}
                    {{ product.price_max_with_tax | money_with_currency: product.currency -}}
                  </div>

                  {%- if editmode or product.description != blank -%}
                    <div class="product-description">
                      {%- editable product.description -%}
                    </div>
                  {% endif -%}

                  <div class="js-buy-btn-content">
                    {% include "buy-button" %}
                  </div>

                  {% content bind=product %}
                </section>
              </div>
            </div>
          </div>

          {%- if bottom_content_size > 0 or editmode -%}
            <section
              class="content-product-wide content-area"
              data-search-indexing-allowed="true">
              {% content bind=product name="content" %}
            </section>
          {%- endif -%}

        </main>

        {% include "footer" %}

      </div>
    </div>
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "template-tools" %}

  <script>
    if (site) {
      site.handleProductPageContent();
      {%- if editmode and product %}
        site.handleProductImageClick({{ product.id }});
      {% endif -%}
    }
  </script>
</body>

</html>
