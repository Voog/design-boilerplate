<!DOCTYPE html>
<html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <!-- FACEBOOK OPENGRAPH -->
    <!-- Global opengraph tags are located in "header" component -->
    <meta property="og:url" content="{{ site.url }}">
    <meta property="og:title" content="{{ site.name }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
    <!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
  </head>
  
  <body class="front-page">
    <div class="container cfx">
      {% include "header" %}
  
      <main class="content cfx" role="main">
        <header class="content-header">
          <h1 class="content-title user-content">{% editable site.header %}</h1>
          <h2 class="user-content">{% content name="slogan" %}</h2>
        </header>
        <section class="content-body user-content">{% content %}</section>
      </main>
  
      {% include "footer" %}
    </div>
  
    {% include "javascripts" %}
    <script>project.initCommonPage();</script>
  </body>
</html>