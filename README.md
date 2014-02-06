design-boilerplate
==================

Edicy design boilerplate

1. BASIC STRUCTURE
Edicy basic design has 4 different templates:
a) Blog & News
b) Blog article
c) Common page
d) Front page

1.1 Code sample
<pre>
  <!DOCTYPE html>
  <html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
  </head>

  <body class="**unique-class-name**">
    <div class="container cfx">
      {% include "site-header" %}

      <main class="content cfx" role="main">
        **TEMPLATE CONTENT AREA**
      </main>

      {% include "site-footer" %}
    </div>

    {% include "javascripts" %}
  </body>
  </html>
</pre>

1.2 Comments
<ul>
  <li>
    Each template has its own unique class name for &lt;body&gt; element.
    <ul>
      <li>&lt;body class="**unique-class-name**"&gt;</li>
    </ul>
  </li>
</ul>