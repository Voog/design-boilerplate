<ul class="menu horizontal cfx">
    <li {% if site.root_item.selected? %} class="active"{% endif %}><a href="{{ site.root_item.url }}">{{ site.root_item.title }}</a></li>
    {% for item in site.menuitems %}
      <li{% if item.selected? %} class="active"{% endif %}><a href="{{ item.url }}">{{ item.title }}</a></li>
    {% endfor %}
    <li class="mobile-lang"><a href="contacts.php">In English</a></li>
    <li class="mobile-lang"><a href="contacts.php">eesti keeles</a></li>
    <li class="mobile-lang"><a href="contacts.php">Suomi</a></li>
    {% if editmode %}
      {% if site.hidden_menuitems.size > 0 %}
        <li>{% menubtn site.hidden_menuitems %}</li>
      {% endif %}
      <li>{% menuadd %}</li>
    {% endif %}
</ul>