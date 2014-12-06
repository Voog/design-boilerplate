{% comment %}SITE WIDE JAVASCRIPTS{% endcomment %}
<script src="{{ javascripts_path }}/main.min.js"></script>

{% comment %}Voog editmode tools.{% endcomment %}
{% if editmode %}
  {% include 'edicy-tools' %}
{% endif %}

{% comment %}Google analytics initiation.{% endcomment %}
{{ site.analytics }}
