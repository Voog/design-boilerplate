<!DOCTYPE html>
<html lang="et">
  <head>
    {% include "html-head" %}
    <!-- FACEBOOK OPENGRAPH -->
    <!-- Global opengraph tags are located in "header" component -->
    <meta property="og:url" content="{{ site.url }}">
    <meta property="og:title" content="{{ site.name }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
    <!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
  </head>

  <body>
    <section class="site-content cfx">
      {% include "site-header" %}

      <main class="page-content cfx" role="main">
        <header class="content-header">
          <h1>{% content name="slogan" %}</h1>
        </header>
        <section class="content-body">
          {% content %}
        </section>
      </main>

      {% include "site-footer" %}
    </section>

    {% include "javascripts" %}
    <script>project.initCommonPage();</script>
  </body>
</html>