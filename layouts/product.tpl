<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">

<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
</head>

<body class="product_page js-bg-picker-area">
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

        <main class="content" role="main">

          {% include "menu-breadcrumbs" %}
          <div class="flex_row flex_row-2 mar_0-32-neg" data-search-indexing-allowed="true">
            <div class="flex_row-2--item-60">
              <div class="mar_0-32 p-rel js-product-page-image-wrap">
                {%- load buy_button to "buy_button" q.content.parent_id=page.id q.content.parent_type="page"
                q.content.name="body" s="content.position" -%}
                {% if buy_button.product != blank %}
                  {%- assign buyButtonImage = buy_button.product.image -%}
                {% endif %}

                {%- if page.data.item_image != blank -%}
                  {%- assign productImage = page.data.item_image -%}
                  {%- assign isProductImage = false -%}
                {%- elsif buyButtonImage != blank -%}
                  {%- assign productImage = buyButtonImage -%}
                  {%- assign isProductImage = true -%}
                {%- else -%}
                  {%- assign productImage = page.image -%}
                  {%- assign isProductImage = false -%}
                {%- endif -%}

                {%- if productImage != blank or editmode -%}
                  <div class="js-product-page-image mar_b-32">
                    {% include 'content-item', _isProductImage: isProductImage, _imageData: productImage, _entityData:
                    page, _itemType: 'page', _id: page.id, _targetWidth: '1280' %}
                  </div>
                {%- endif -%}
              </div>
              <section class="content-body content-formatted mar_0-32 mar_t-32" data-search-indexing-allowed="true">
                {% content name="gallery" %}
              </section>
            </div>

            <div class="flex_row-2--item-40">
              <div class="mar_0-32 flex_col">
                <section class="content-body content-formatted js-buy-btn-content mar_32-0"
                  data-search-indexing-allowed="true">
                  {% contentblock %}{{ "write_product_description_here" | lc: editor_locale }}{% endcontentblock %}
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