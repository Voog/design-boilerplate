{% comment %}Set body class based on current viewing mode.{% endcomment %}
{% capture dont_render %}
  {% if editmode %}
    {% assign view_mode = "editmode" %}
  {% else %}
    {% assign view_mode = "publicmode" %}
  {% endif %}
{% endcapture %}
