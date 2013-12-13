<!DOCTYPE html>
<html lang="et">
  <!-- <html lang="{{ page.language_code }}"> -->
<head>
  <?php require("components/html-head.php") ?>
    <!-- {% include "html-head" %} -->
</head>

<body>
  <section class="site-content cfx">
    <?php require("components/site-header.php") ?>
      <!-- {% include "site-header" %} -->

    <main class="page-content cfx" role="main">
      <header class="content-header">
        {% contentblock name="slogan" %}{{ "title_goes_here" | lc }}{% endcontentblock %}
      </header>
      {% content %}
    </main>

    <?php require("components/site-footer.php") ?>
      <!-- {% include "site-footer" %} -->
  </section>

  <script>var pageType = "front"</script>
  <?php require("components/javascripts.php") ?>
    <!-- {% include "javascripts" %} -->
  <script>project.initCommonPage();</script>
</body>
</html>