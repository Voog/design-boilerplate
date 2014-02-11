<!DOCTYPE html>
<html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <!-- FACEBOOK OPENGRAPH -->
    <!-- Global opengraph tags are located in "header" component -->
    <meta property="og:url" content="{{ site.url }}/{{ page.path }}">
    <meta property="og:title" content="{{ page.title }} — {{ site.name }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
    <!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
  </head>
  
  <body class="common-page">
    <div class="container cfx">
      {% include "header" %}
  
      <main class="content" role="main">
        <header class="content-header">
          <h1 class="content-formatted cfx">{% content name="slogan" %}</h1>
        </header>
        <section class="content-body content-formatted cfx">{% content %}</section>
      </main>
  
      {% include "footer" %}
    </div>
  
    {% include "javascripts" %}
    <script>project.initCommonPage();</script>
  </body>
</html>