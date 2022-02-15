{%- if product.price_min_with_tax != product.price_max_with_tax -%}
  {%- assign with_price = true -%}
{%- else -%}
  {%- assign with_price = false -%}
{%- endif -%}

{%- capture _button_attributes %}
  data-product-id="{{ product.id }}"
  data-product="{{ product | json | escape }}"
  data-settings="{&quot;title&quot;:&quot;{{ "add_to_cart" | lc | escape_once }}&quot;
    {%- if with_price -%}
      ,&quot;button_style&quot;:&quot;with_price&quot;
    {%- endif -%}
  }"
{% endcapture -%}

{% if editmode != true and product.available? == false %}
  <div class="edy-buy-button-container edy-buy-button-view">
    <div class="form_field">
      <div class="edy-buy-button custom-btn custom-btn-disabled edy-buy-button-disabled">
        <span class="edy-buy-button-title">{{ 'ecommerce.buy_button.currently_unavailable' | lc }}</span>
      </div>
    </div>
  </div>
{% elsif product.uses_variants %}
  <div class="edy-buy-button-container edy-buy-button-view" {{ _button_attributes }}>
    <div class="edy-buy-button-variants">
      {% for variant_type in product.variant_types %}
        <div class="form_field" data-variation-id="{{ variant_type.id }}">
          <label class="form_field_label">{{ variant_type.name | escape_once }}</label>
          <select class="form_field_select" data-variation-attribute-id="{{ variant_type.id }}">
            <option value="">---</option>
            {%- for variant_value in variant_type.variant_values %}
              <option value="{{ variant_value.id }}">{{ variant_value.name | escape_once }}</option>
            {%- endfor %}
          </select>
        </div>
      {% endfor %}
    </div>
    <div class="form_field">
      <div class="edy-buy-button custom-btn custom-btn-disabled edy-buy-button-disabled">
        {%- if product.out_of_stock? %}
          <span class="edy-buy-button-title">{{ 'out_of_stock' | lc | escape_once }}</span>
        {% else %}
          <span class="edy-buy-button-title">{{ 'add_to_cart' | lc | escape_once }}</span>
        {% endif -%}

        {%- if with_price and product.price_min_with_tax == product.price_max_with_tax -%}
          <span class="edy-buy-button-price">{{ product.price_with_tax | money_with_currency: product.currency }}</span>
        {%- endif -%}
      </div>
    </div>
  </div>
{% else %}
  {% if editmode or product.out_of_stock? %}
    {% assign buy_button_classes = "custom-btn-disabled edy-buy-button-disabled" %}
  {% endif %}
  <div class="edy-buy-button-container edy-buy-button-view">
    <div class="form_field">
      <div class="edy-buy-button custom-btn {{ buy_button_classes }}" {{ _button_attributes }}>
        {% if product.out_of_stock? %}
          <span class="edy-buy-button-title">{{ 'out_of_stock' | lc | escape_once }}</span>
        {% else %}
          <span class="edy-buy-button-title">{{ 'add_to_cart' | lc | escape_once }}</span>
        {% endif %}
      </div>
    </div>
  </div>
{% endif %}
