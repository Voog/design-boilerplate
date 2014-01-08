<!DOCTYPE html>
<html lang="et">
<head>
  {% include "html-head" %}
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