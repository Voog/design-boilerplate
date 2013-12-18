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
        <h1>THIS IS WHERE YOUR PRODUCTS LIVE.</h1>
      </header>
      <section class="content-body">
        <div class="photo_gallery_area edys-gallery-area cfx">
          <style type="text/css" scoped="scoped">.edys-gallery a { padding-right: 5px; }</style>
          <div class="edys-gallery cfx">
            <a href="photos/gallery-1.jpg" class="edys-gallery-item" data-original-url="photos/gallery-1.jpg" rel="">
              <img src="photos/gallery-1.jpg" border="0" class="edys-gallery-image" alt="">
            </a>
            <a href="photos/gallery-2.jpg" class="edys-gallery-item" data-original-url="photos/gallery-2.jpg" rel="">
              <img src="photos/gallery-2.jpg" border="0" class="edys-gallery-image" alt="">
            </a>
            <a href="photos/gallery-3.jpg" class="edys-gallery-item" data-original-url="photos/gallery-3.jpg" rel="">
              <img src="photos/gallery-3.jpg" border="0" class="edys-gallery-image" alt="">
            </a>
            <a href="photos/gallery-4.jpg" class="edys-gallery-item" data-original-url="photos/gallery-4.jpg" rel="">
              <img src="photos/gallery-4.jpg" border="0" class="edys-gallery-image" alt="">
            </a>
            <a href="photos/gallery-5.jpg" class="edys-gallery-item" data-original-url="photos/gallery-5.jpg" rel="">
              <img src="photos/gallery-5.jpg" border="0" class="edys-gallery-image" alt="">
            </a>
            <a href="photos/gallery-6.jpg" class="edys-gallery-item" data-original-url="photos/gallery-6.jpg" rel="">
              <img src="photos/gallery-6.jpg" border="0" class="edys-gallery-image" alt="">
            </a>
          </div>
        </div>
        <link href="http://static.edicy.com/libs/edicy-gallery/3.0/edicy-gallery.css?1" media="screen" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="http://static.edicy.com/libs/edicy-gallery/3.0/edicy-gallery.min.js?1"></script>

        <h2>This is heading 2</h2>
        <p>This is a large picture that perfectly scales down to fit into content area:</p>

        <h3>This is heading 3</h3>
        <p>This is a small picture in original size:</p>
        <img src="http://placeimg.com/320/240/any">
        <h4>Heading 4</h4>
        <h5>Heading 5</h5>
        <h6>And heading 6 will be styles the same as heading 3</h6>
      </section>
    </main>

    <?php require("components/site-footer.php") ?>
  </section>

  <script>var pageType = "common"</script>
  <?php require("components/javascripts.php") ?>
  <script>project.initCommonPage();</script>
</body>
</html>