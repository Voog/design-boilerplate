<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include 'html-head' %}
  </head>

  <body class="common-page">
    <div class="site-container">
      {% include 'site-header' %}

      <main class="page-content content-formatted" role="main">
        <header class="content-header">{% contentblock name="content_header" %}<h1>{{ page.title }}</h1>{% endcontentblock %}</header>
        <div class="content-body">{% content %}</div>
      </main>

      {% include 'site-footer' %}

      {% include 'site-javascripts' %}
      <script>site.initCommonPage();</script>
    </div>
  </body>
</html>
