{%- comment -%}
  Product image & background picker image object have different keys
{%- endcomment -%}

{%- if _targetWidth != blank -%}
  {%- assign _maxWidth = _targetWidth | plus:0 -%}
  {%- assign sizes = "(min-width: " | append: _targetWidth | append: ") " | append: _targetWidth | append: 'px' -%}
{%- else -%}
  {%- assign _maxWidth = _data.width -%}
  {%- assign sizes = '100vw' -%}
{%- endif -%}

{% include 'image-src-variable', _data: _data, _targetWidth: _maxWidth %}

<img class="js-lazyload {{ _className }}"
  data-src="{{ _src }}" data-sizes="{{ sizes }}" {% if _altAttr != blank %}title="{{ _altAttr | escape_once }}" alt="{{ _altAttr  | escape_once }}"{% endif %}
  {% if _src == blank %}style="display: none;"{%- endif -%}
  {% if _data[imageSizes] != blank -%}
    {%- if _data[imageSizes].size >= 1 %}
      data-srcset="
        {%- for image in _data[imageSizes] -%}
          {%- if image.width <= _maxWidth -%}
            {{ image[urlKey] }} {{ image.width }}w
            {%- unless forloop.last -%}
            ,
            {%- endunless -%}
          {%- endif -%}
        {%- endfor -%}
      "
    {%- endif -%}
  {%- endif -%}
/>