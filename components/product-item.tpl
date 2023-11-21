{% if _buyButton.product != blank %}
  {%- assign buyButtonImage = _buyButton.product.image -%}
{% else %}
  {%- assign buyButtonImage = null -%}
{% endif %}

{%- if _entityData.data.item_image != blank -%}
  {%- assign productImage = _entityData.data.item_image -%}
{%- elsif buyButtonImage != blank -%}
  {%- assign productImage = buyButtonImage -%}
{%- else -%}
  {%- assign productImage = _entityData.page.image -%}
{%- endif -%}

{%- if productImage == blank -%}
  {% assign item_image_state = "without-image" %}
{%- else -%}
  {% assign item_image_state = null %}
{%- endif -%}

{% if _entityData.data.image_crop_state %}
  {%- assign imageClass = 'item-image ' | append: _entityData.data.image_crop_state -%}
{% else %}
  {%- assign imageClass = 'item-image not-cropped' -%}
{% endif %}

<a class="content-item-box {{ item_image_state }}" href="{{ _entityData.url }}">
  <div class="item-top p-rel">
    <div class="top-inner of-hidden">
      {% include "lazy-image",
        _altAttr:
        _entityData.data.image_alt_attr,
        _data: productImage,
        _targetWidth: '1280',
        _className: imageClass
      %}
    </div>
  </div>
</a>

<div class="product_item-details--wrap mar_t-16">
  <div class="flex_auto">
    {%- capture look_closer_btn -%}
      <a class="product_item-btn{%- if _buyButton.product.price != blank %} p-abs{%- else %} p-rel{%- endif -%}" href="{{ _entityData.url }}">
        {{ "look_closer" | lc | escape_once }}
      </a>
    {%- endcapture -%}

    <a class="p14 bold product_item-title bold" href="{{ _entityData.url }}">
      {{ _entityData.title | escape_once }}
    </a>
    {%- if _buyButton.product != blank and _buyButton.available? -%}
      <div class="product_item-details flex_col">
        {%- if _buyButton.product.uses_variants == true -%}
          {{ look_closer_btn }}
          <div class="product_item-price">
            <div class="flex_box">
              {%- capture original_price -%}
                {%- if _buyButton.product.price_max_with_tax != _buyButton.product.price_min_with_tax -%}
                  {{ _buyButton.product.price_min_with_tax | money_with_currency: _buyButton.product.currency }}
                  <span> – </span>
                {%- endif -%}
                {{ _buyButton.product.price_max_with_tax | money_with_currency: _buyButton.product.currency }}
              {%- endcapture -%}

              <div class="product-price">
                {% if _buyButton.product.on_sale? %}
                  <s class="product-price-original">
                    {{- original_price -}}
                  </s>
                {% endif %}

                <span class="product-price-final">
                  {%- if _buyButton.product.on_sale? -%}
                    {% if _buyButton.product.effective_price_min_with_tax != _buyButton.product.effective_price_max_with_tax %}
                      {{- _buyButton.product.effective_price_min_with_tax | money_with_currency: _buyButton.product.currency -}}
                      <span> – </span>
                    {%- endif -%}
                    {{- _buyButton.product.effective_price_max_with_tax | money_with_currency: _buyButton.product.currency -}}
                  {%- else -%}
                    {{- original_price -}}
                  {%- endif -%}
                </span>
              </div>
            </div>
          </div>
        {%- else -%}
          {%- if editmode or buy_button.product.out_of_stock? -%}
            {{ look_closer_btn }}
          {%- else -%}
            <div class="product_item-btn js-cart-btn p-abs" data-product-id="{{ _buyButton.product.id }}">{{ "add_to_cart" | lc | escape_once }}</div>
          {%- endif -%}
          <div class="product_item-price">
            <span class="product-price">
              {%- if _buyButton.product.on_sale? -%}
                <s class="product-price-original">
                  {{ _buyButton.product.price_min_with_tax | money_with_currency: _buyButton.product.currency }}
                </s>
              {%- endif -%}

              <span class="product-price-final">
                {{- _buyButton.product.effective_price_min_with_tax | money_with_currency: _buyButton.product.currency -}}
              </span>
            </span>
          </div>

        {%- endif -%}
      </div>
    {%- else -%}
      <div class="flex_col product_item-details">
        {{ look_closer_btn }}
      </div>
    {%- endif -%}
  </div>
  {%- if buy_button.product.out_of_stock? -%}
    <div class="product_item-box--label">{{ "out_of_stock" | lc | escape_once }}</div>
  {%- endif -%}
</div>
