{%- if _data.content_type != blank -%}
  {%- assign imageSizes = 'sizes' -%}
  {%- assign urlKey = 'schemeless_url' -%}
{%- else -%}
  {%- assign imageSizes = 'imageSizes' -%}
  {%- assign urlKey = 'url' -%}
{%- endif -%}

{%- assign _src = _data[imageSizes].first[urlKey] -%}

{%- assign _maxWidth = _targetWidth | plus:0 -%}

{%- for image in _data[imageSizes] -%}
  {%- if image.width <= _maxWidth -%}
    {% break %}
  {%- endif -%}
    {%- assign _src = image[urlKey] -%}
{%- endfor -%}
 