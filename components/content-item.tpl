{% unless _imageData != blank %}
  {% assign item_image_state = "without-image" %}
{% else %}
  {% assign item_image_state = "with-image" %}
{% endunless %}

{% if _entityData.data.image_crop_state %}
  {% assign image_crop_state = _entityData.data.image_crop_state %}
{% else %}
  {% assign image_crop_state = "not-cropped" %}
{% endif %}

{%- if _staticItem == true -%}
  {%- assign wrapperTag = 'div' -%}
{%- else -%}
  {%- assign wrapperTag = 'a' -%}
{%- endif -%}

{% if editmode and _staticItem != true %}
  <div class="content-item-box p-rel {{ item_image_state }} js-content-item-box not-loaded"
    data-item-type="{{_itemType}}"
    data-item-id="{{ _id }}"
  >
    <div class="image_settings js-prevent-sideclick"{% if _imageData == blank %} style="display: none;"{% endif %}>
      <div class="image_settings-buttons">
        <div class="image_settings-button--title mar_r-8">{{ "image" | lc }}</div>
          <button class="bg_img-contain image_settings-button mar_r-8 btn-no-style js-toggle-image-settings">
          </button>
        <button class="bg_img-contain image_settings-expand mar_r-8 btn-no-style js-toggle-crop-state">
        </button>
        <button class="bg_img-contain image_settings-remove btn-no-style js-remove-image" {%- if _isProductImage == true %} style="display: none;"{% endif %}>
        </button>
      </div>

      <div class="settings_popover js-image-settings-popover">
        <div class="settings_popover-arrow--up"></div>
        <div class="product_alt-attr {{ item_image_state }}">
          <div class="form_field-cms">
            <input
              id="item-image-alt-{{_id}}"
              class="form_field_textfield js-data-item image_settings-remove--input"
              value="{{_entityData.data.image_alt_attr}}"
              data-name="{{image_alt_attr}}"
              data-entity="{{_itemType}}"
              data-id="{{_id}}"
            >
            <label for="item-image-alt-{{_id}}" class="form_field_label">{{ "alt_text" | lc }}</label>
          </div>
        </div>
      </div>
    </div>

    {% include 'image-src-variable', _data: _imageData, _targetWidth: _targetWidth %}

    <div class="item-top">
      <div class="top-inner aspect-ratio-inner image-drop-area {{ image_crop_state }} js-content-item-img-drop-area js-lazyload"
        data-image="{{ _src }}"
        {%- if _isProductImage == true -%}
          {% if _src != blank -%}
            style="background-image: url({{_src}});"
          {%- endif -%}
        {%- endif -%}
      ></div>
    </div>
  </div>
{% else %}
  <{{ wrapperTag }} class="content-item-box {{ item_image_state }} js-content-item-box not-loaded"{% if _staticItem != true %} href="{{ _entityData.url }}"{% endif %}>
    <div class="item-top">
      <div class="top-inner of-hidden">
        {% if _imageData != blank %}
          <div class="loader js-loader"></div>
          {%- assign imageClass = "item-image " | append: image_crop_state -%}
          {% include "lazy-image", _altAttr: _entityData.data.image_alt_attr, _data: _imageData, _targetWidth: _targetWidth, _className: imageClass  %}
        {% else %}
          <div class="item-image-placeholder"></div>
        {% endif %}
      </div>
    </div>
  </{{ wrapperTag }}>
{% endif %}
