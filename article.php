<!DOCTYPE html>
<html lang="et">
  <!-- <html lang="{{ page.language_code }}"> -->
<head>
  <?php require("components/html-head.php") ?>
    <!-- {% include "html-head" %} -->
    <!-- {{ blog.rss_link }} -->
</head>
<body>
  <section class="site-content cfx">
    <?php require("components/site-header.php") ?>
      <!-- {% include "site-header" %} -->

    <main class="page-content cfx" role="main">
      <article class="post">
        <header class="post-header">
          <h1 class="post-title">How I wrote my first article</h1>
          <time datetime="2013-11-25" class="post-date">06.04.2014</time>
          <?php require("components/tags-article.php") ?>
            <!-- {% include "tags-article" %} -->
        </header>
        <section class="post-excerpt">
          <p>Post news of any subject your audience would appreciate. Delete this temporary post from the Blogs section below. By the way, you can add any kind of content to your blog post — text, pictures, tables, forms, and galleries.</p>
        </section>
        <section class="post-body">
          <p>The above is excerpt of the article. It appears in the blog post listing. This here is the body of the post. This only appears here, on the post page.</p>
        </section>
      </article>
    </main>

    <?php require("components/site-footer.php") ?>
      <!-- {% include "site-footer" %} -->

  </section>

  <script>var pageType = "blog"</script>
  <?php require("components/javascripts.php") ?>
    <!-- {% include "javascripts" %} -->
  <script>project.initArticlePage();</script>
</body>
</html>