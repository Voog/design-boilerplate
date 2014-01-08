<!DOCTYPE html>
<html lang="et">
<head>
  {% include "html-head" %}
</head>

<body class="front-page">
  <section class="site-content cfx">
    {% include "site-header" %}

    <main class="page-content cfx" role="main">
      <header class="content-header">
        <h1 class="front-page-title">{% editable site.header %}</h1>
        <h2>{% content name="slogan" %}</h2>
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