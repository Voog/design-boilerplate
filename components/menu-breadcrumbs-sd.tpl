{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}

<ul class="menu menu-horizontal menu-public menu-breadcrumbs" data-search-indexing-allowed="false">
  {%- for listItem in breadcrumbsObj.itemListElement %}
    {%- assign pageUrl = page.url | remove_first: "/" -%}

    <li class="menu-item">
      <a class="{% if forloop.index > 1 %}with_arrow{% endif %} menu-link" href="/{{ listItem.item.id }}">
        {{ listItem.item.name }}
      </a>
    </li>
  {% endfor -%}
</ul>
