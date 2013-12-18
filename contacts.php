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
        <h1>Site title</h1>
        <h2>Here’s a good place for your slogan.</h2>
      </header>
      <section class="content-body">
        <p>My company<br>1192 Cambridge Street<br>Cambridge, MA 02139<br>United States<br><br>Phone: +1 617-576-1950<br>Email: email@yourname.com<br>Find us on the map:</p>
        <iframe src="http://maps.google.com/maps?f=q&amp;hl=en&amp;q=boston@42.3584308,-71.0597732&amp;ie=UTF8&amp;ll=42.3584308,-71.0597732&amp;z=12&amp;iwloc=A&amp;output=embed" width="100%" height="525" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
      </section>
    </main>

    <?php require("components/site-footer.php") ?>
  </section>

  <script>var pageType = "front"</script>
  <?php require("components/javascripts.php") ?>
  <script>project.initCommonPage();</script>
</body>
</html>