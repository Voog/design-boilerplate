<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">

<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
</head>

{% capture bottom_content_html %}
  {% unless editmode %}
    {% content bind=product name="content" %}
  {% endunless %}
{% endcapture %}

{% assign bottom_content_size = bottom_content_html | strip | size %}

{% capture gallery_content_html %}
  {% unless editmode %}
    {% content bind=product name="gallery" %}
  {% endunless %}
{% endcapture %}

{% assign gallery_content_size = gallery_content_html | strip | size %}

<body class="product_page">
  <div class="container">
    <div class="js-background-type">
      <div class="background-color js-background-color">

        {% include "header" %}

        <main class="content" role="main">

          {% include "menu-breadcrumbs-sd" %}

          <div class="flex_row flex_row-2 product-content" data-search-indexing-allowed="true">
            <div class="flex_row-2--item-60">
              <div class="mar_0-32 p-rel js-product-page-image-wrap">
                {%- if product.image != blank %}
                  {% assign item_image_state = "with-image" %}
                {% else %}
                  {% assign item_image_state = "without-image" %}
                {% endif -%}

                <div class="content-item-box {{ item_image_state }} js-content-item-box">
                  <div class="item-top">
                    <div class="top-inner">
                      {%- if product.image != blank %}
                        {% image product.image loading: 'lazy' target_width: "1280" class: "item-image not-cropped" %}
                      {% endif -%}
                    </div>
                  </div>
                </div>
              </div>

              {%- if gallery_content_size > 0 or editmode -%}
                <section class="content-body content-formatted mar_t-32 js-product-gallery" data-search-indexing-allowed="true">
                  {% content bind=product name="gallery" %}
                </section>
              {% endif -%}
            </div>

            <div class="flex_row-2--item-40">
              <div class="flex_col">
                <section class="content-body content-formatted mar_32-0" data-search-indexing-allowed="true">
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

  <script>template && template.handleProductPageContent();</script>
</body>

</html>
