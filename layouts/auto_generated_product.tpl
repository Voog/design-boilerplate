<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">

<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
</head>

<body class="product_page">
    {%- capture _button_attributes %}
      data-product-id="{{ product.id }}"
      data-product="{{ product | json | escape }}"
      data-settings="{&quot;title&quot;:&quot;{{ "add_to_cart" | lc | escape_once }}&quot;,&quot;button_style&quot;:&quot;with_price&quot;}"
    {% endcapture -%}

  <div class="container">
    <div class="js-background-type">
      <div class="background-color js-background-color">

        {% include "header" %}

        <main class="content" role="main">
          <div class="flex_row flex_row-2 mar_0-32-neg" data-search-indexing-allowed="true">
            <div class="flex_row-2--item-60">
              <div class="mar_0-32 p-rel js-product-page-image-wrap">
                {%- assign product_image = product.image -%}

                {%- if product_image != blank %}
                  {% assign item_image_state = "with-image" %}
                {% else %}
                  {% assign item_image_state = "without-image" %}
                {% endif -%}

                <div class="js-product-page-image mar_b-32">
                  <div class="content-item-box {{ item_image_state }} js-content-item-box">
                    <div class="item-top">
                      <div class="top-inner of-hidden">
                        {%- if product_image != blank %}
                          <div class="loader js-loader"></div>
                          {% image product_image loading: 'lazy' target_width: 1280 class: "item-image not-cropped" %}
                        {% endif -%}
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <section class="content-body content-formatted mar_0-32 mar_t-32" data-search-indexing-allowed="true">
                {% content name="gallery" %}
              </section>
            </div>

            <div class="flex_row-2--item-40">
              <div class="mar_0-32 flex_col">
                <section class="content-body content-formatted js-buy-btn-content mar_32-0" data-search-indexing-allowed="true">
                  <div class="content-item-title content-area">
                    <h3>{%- editable product.name -%}</h3>
                  </div>

                  <div class="product-price bold mar_b-16">
                    {%- if product.price_max_with_tax != product.price_min_with_tax -%}
                    {{ product.price_min_with_tax | money_with_currency: product.currency -}}
                      <span class="pad_0-4">–</span>
                    {%- endif -%}
                    {{ product.price_max_with_tax | money_with_currency: product.currency }}
                  </div>

                  {%- if editmode or product.description != blank -%}
                    <div class="product-description">
                      {%- editable product.description -%}
                    </div>
                  {% endif -%}

                  {% content bind=product %}

                  {% include "buy-button" %}
                </section>
              </div>
            </div>
          </div>
        </main>
      </div>

      {% include "footer" %}

    </div>
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "template-tools" %}
  <script>site.initProductPage();</script>
</body>

</html>
