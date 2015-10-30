<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="front-page">
    <div class="site-container">
      {% include "site-header" %}
      {% comment %}{% include "site-sidebar" %}{% endcomment %}

      <main class="page-content" role="main">
        <section class="content-area">
          <header class="content-header">{% contentblock name="content_header" %}<h1>{{ page.site_title }}</h1>{% endcontentblock %}</header>
          <div class="content-slogan">{% content name="slogan" %}</div>
          <div class="content-body">{% content %}</div>
        </section>
      </main>

      {% include "site-footer" %}
      {% include "site-javascripts" %}
      <script>site.initFrontPage();</script>
    </div>
  </body>
</html>
