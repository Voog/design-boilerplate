<!DOCTYPE html>
{%- assign product_page = true -%}
{%- include "template-settings" -%}
{%- include "template-variables" -%}

<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">

<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "template-styles" %}

  {% sd_product %}
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

{%- capture product_social_html -%}
  {%- unless editmode -%}
    {%- xcontent name="product-social" -%}
  {%- endunless -%}
{%- endcapture -%}

{%- assign product_social_size = product_social_html | strip | size -%}

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
                {%- if product.photos != blank -%}
                  {%- assign item_image_state = "with-images" -%}
                {%- else -%}
                  {%- assign item_image_state = "without-images" -%}
                {%- endif -%}

                <div class="content-item-box {{ item_image_state }} js-content-item-box">
                  {%- if product.photos == blank -%}
                    <div class="item-top without-pointer"></div>
                  {%- else -%}
                    <div class="product-gallery">
                      {% gallery product layout="product_slider" %}
                    </div>
                  {%- endif -%}
                </div>
              </div>

              {%- if gallery_content_size > 0 or editmode -%}
                <section class="mar_0-16 content-body content-formatted mar_t-32 js-product-gallery" data-search-indexing-allowed="true">
                  {%- assign gallery_title = "gallery" | lce -%}
                  {%- assign gallery_title_tooltip = "content_tooltip_additional_images" | lce -%}
                  {% content bind=product name="gallery" title=gallery_title title_tooltip=gallery_title_tooltip %}
                </section>
              {% endif -%}
            </div>

            <div class="flex_row-2--item-40 js-product-content-right">
              <div class="mar_0-16 flex_col">
                <section class="content-body content-formatted" data-search-indexing-allowed="true">
                  <div class="content-item-title content-area">
                    <h1>{%- editable product.name -%}</h1>
                  </div>

                  {%- capture original_price -%}
                    {% if product.price_min_with_tax != product.price_max_with_tax -%}
                      {{- product.price_min_with_tax | money_with_currency: product.currency -}}
                      <span> – </span>
                    {%- endif -%}
                    {{- product.price_max_with_tax | money_with_currency: product.currency -}}
                  {%- endcapture -%}

                  <div class="product-price">
                    {% if product.on_sale? -%}
                      <s class="product-price-original">
                        {{- original_price -}}
                      </s>
                    {% endif -%}

                    <span class="product-price-final">
                      {%- if product.on_sale? -%}
                        {% if product.effective_price_min_with_tax != product.effective_price_max_with_tax %}
                          {{- product.effective_price_min_with_tax | money_with_currency: product.currency -}}
                          <span> – </span>
                        {%- endif -%}
                        {{- product.effective_price_max_with_tax | money_with_currency: product.currency -}}
                      {% else %}
                        {{ original_price }}
                      {% endif -%}
                    </span>
                  </div>

                  {%- if editmode or product.description != blank -%}
                    <div class="product-description">
                      {%- editable product.description -%}
                    </div>
                  {% endif -%}

                  <div class="js-buy-btn-content">
                    {% include "buy-button" %}
                  </div>

                  {%- if editmode or product_social_size > 0 -%}
                    <div class="mar_b-32">
                      {%- assign cross_page_info_title = "cross_page_info" | lce  -%}
                      {%- assign cross_page_info_title_tooltip = "content_tooltip_all_pages_same_type" | lce -%}
                      {% xcontent name="product-social" title=cross_page_info_title title_tooltip=cross_page_info_title_tooltip %}
                    </div>
                  {%- endif -%}

                  {%- assign content_title = "content" | lce -%}
                  {%- assign content_title_tooltip = "content_tooltip_specific_page" | lce -%}
                  {% content bind=product title=content_title title_tooltip=content_title_tooltip %}
                </section>
              </div>
            </div>
          </div>

          {%- if bottom_content_size > 0 or editmode -%}
            <section
              class="content-product-wide content-area"
              data-search-indexing-allowed="true">
              {%- assign bottom_content_title = "additional_content" | lce -%}
              {%- assign bottom_content_title_tooltip = "content_tooltip_additional_information" | lce -%}
              {% content bind=product name="content" title=bottom_content_title title_tooltip=bottom_content_title_tooltip %}
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
    }
  </script>
</body>

</html>
