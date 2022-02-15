{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}

<ul class="menu menu-horizontal menu-public menu-breadcrumbs" data-search-indexing-allowed="false">
  {%- assign rootShown = true -%}
  {%- for listItem in breadcrumbsObj.itemListElement %}
    {% if forloop.first and forloop.length > 2 %}
      {%- assign rootShown = false -%}
      {% continue %}
    {% endif %}
    <li class="menu-item">
      <a class="{% if rootShown == false and forloop.index > 2 %}with_arrow{% elsif rootShown == true and forloop.index > 1 %}with_arrow{% endif %}{% if forloop.last %} current-page{% endif %} menu-link" href="/{{ listItem.item.id }}">
        {{ listItem.item.name }}
      </a>
    </li>
  {% endfor -%}
</ul>
