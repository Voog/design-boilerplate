{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}


<ul class="menu menu-horizontal menu-public menu-breadcrumbs" data-search-indexing-allowed="false">
  {%- if breadcrumbsObj.itemListElement.size > 2 -%}
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
  {%- endif -%}

  {%- if editmode and page.layout_title == product_list_layout -%}
    <li class="menu-item">
      {% include 'add-page-button' _menuItem: page %}
    </li>
  {%- endif -%}
</ul>
