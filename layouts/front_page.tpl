<!DOCTYPE html>
{% include "template-variables" %}
<html class="front-page {{ view_mode }} {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body>
    <div class="site-container">
      <div class="wrap">
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
      </div>

      {% include "template-tools" %}
      <script>site.initFrontPage();</script>
    </div>
  </body>
</html>
