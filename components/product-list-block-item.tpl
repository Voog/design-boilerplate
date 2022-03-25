{%- load buy_button to "buy_button" q.content.parent_id=_entityData.page_id q.content.parent_type="page"
q.content.name="body" s="content.position" -%}
<div class="product_item js-product-item flex_row-3--item">
  <div class="mar_0-16">
    <div class="product_item-wrap product_item_list p-rel">
      {%- if _entityData.layout_title == product_list_layout -%}
      {% include 'content-item', _imageData: _entityData.data.item_image, _entityData: _entityData, _itemType:
      'page', _id: _entityData.page_id, _targetWidth: '600' %}
      <a class="p14 mar_t-16" href="{{ _entityData.url }}">
        <div class="p14 mar_t-16 bold product_item-title">
          {{ _entityData.title | escape_once }}
        </div>
      </a>
      <div class="flex_box product_item-details">
        <a class="product_item-btn p-rel" href="{{ _entityData.url }}">{{ "look_closer" | lc | escape_once }}</a>
      </div>
      {%- else -%}
      {% include 'product-item', _buyButton: buy_button, _entityData: _entityData %}
      {%- endif -%}
    </div>
  </div>
</div>
