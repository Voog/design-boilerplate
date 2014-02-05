<ul class="menu horizontal cfx">
    <li {% if site.root_item.selected? %} class="active"{% endif %}><a href="{{ site.root_item.url }}">{{ site.root_item.title }}</a></li>
    {% for item in site.menuitems %}
      <li{% if item.selected? %} class="active"{% endif %}><a href="{{ item.url }}">{{ item.title }}</a></li>
    {% endfor %}
    {% for language in site.languages %}
      <li class="mobile-lang{% if language.selected? %} active{% endif %}"><a href="{{ language.url }}">{{ language.title }}</a></li>
    {% endfor %}
    {% if editmode %}
      {% if site.hidden_menuitems.size > 0 %}
        <li>{% menubtn site.hidden_menuitems %}</li>
      {% endif %}
      <li>{% menuadd %}</li>
    {% endif %}
</ul>