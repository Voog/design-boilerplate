{%- capture breadcrumbsScript -%}
  {%- sd_breadcrumbs -%}
{%- endcapture -%}
{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}

<ul class="menu menu-horizontal menu-public menu-breadcrumbs">
  {%- for listItem in breadcrumbsObj.itemListElement %}
    {% unless forloop.index == 1 %}
      {%- assign pageUrl = page.url | remove_first: "/" -%}

      {%- if pageUrl == listItem.item.id -%}
        {%- assign breadcrumbTag = 'div' -%}
        {%- assign isCurrentPage = true -%}
      {%- else -%}
        {%- assign breadcrumbTag = 'a' -%}
        {%- assign isCurrentPage = false -%}
      {%- endif -%}

      <li class="menu-item">
        <{{ breadcrumbTag }} class="{% if forloop.index > 2 %}with_arrow{% endif %}{% if isCurrentPage == false %} menu-link" href="/{{ listItem.item.id }}{% endif %}">
          {{ listItem.item.name }}
        </{{ breadcrumbTag }}>
      </li>
    {% endunless -%}
  {% endfor -%}
</ul>
