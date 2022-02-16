{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}
{%- if breadcrumbsObj.itemListElement.size > 2 -%}
  {%- assign breadcrumbsOffset = 1 -%}
{%- else -%}
  {%- assign breadcrumbsOffset = 0 -%}
{%- endif -%}

<ul class="menu menu-horizontal menu-public menu-breadcrumbs" data-search-indexing-allowed="false">
  {%- assign rootShown = true -%}
  {%- for listItem in breadcrumbsObj.itemListElement offset: breadcrumbsOffset %}
    <li class="menu-item">
      <a class="{% if forloop.index > 1 %}with_arrow{% endif %}{% if forloop.last %} current-page{% endif %} menu-link" href="/{{ listItem.item.id }}">
        {{ listItem.item.name }}
      </a>
    </li>
  {% endfor -%}
</ul>
