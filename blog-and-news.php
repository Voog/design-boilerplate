<!DOCTYPE html>
<html lang="et">
<head>
  <?php require("components/html-head.php") ?>
</head>
<body>
  <section class="site-content cfx">
    <?php require("components/site-header.php") ?>

    <main class="page-content cfx" role="main">
      <?php require("components/tags-blog.php") ?>
        <article class="post">
          <header class="post-header">
            <h1 class="post-title"><a href="article.php">Site title</a></h1>
            <time datetime="88.10.21" class="post-date">21.10.88</time>
          </header>
          <section class="post-excerpt">Excerpt</section>
        </article>

        <article class="post">
          <header class="post-header">
            <h1 class="post-title"><a href="article.php">Site title</a></h1>
            <time datetime="88.10.21" class="post-date">21.10.88</time>
          </header>
          <section class="post-excerpt">Excerpt</section>
        </article>

        <article class="post">
          <header class="post-header">
            <h1 class="post-title"><a href="article.php">Site title</a></h1>
            <time datetime="88.10.21" class="post-date">21.10.88</time>
          </header>
          <section class="post-excerpt">Excerpt</section>
        </article>
    </main>

    <?php require("components/site-footer.php") ?>
  </section>

  <?php require("components/javascripts.php") ?>
  <script>project.initBlogPage();</script>
</body>
</html>