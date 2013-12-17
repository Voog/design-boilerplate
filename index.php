<!DOCTYPE html>
<html lang="et">
<head>
  <?php require("components/html-head.php") ?>
</head>

<body>
  <section class="site-content cfx">
    <?php require("components/site-header.php") ?>

    <main class="page-content cfx" role="main">
      <header class="content-header">
        Title goes here
      </header>
      Content area
    </main>

    <?php require("components/site-footer.php") ?>
  </section>

  <script>var pageType = "front"</script>
  <?php require("components/javascripts.php") ?>
  <script>project.initCommonPage();</script>
</body>
</html>