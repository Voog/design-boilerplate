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

      <?php require("components/tags-blog.php") ?>
        <!-- {% include "tags-blog" %} -->

        {% addbutton %}
        {% for article in articles %}
          <article class="post">
            <header class="post-header">
              <h1 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h1>
              <time datetime="{{ article.created_at | date : '%Y-%m-%d' }}" class="post-date">{{ article.created_at | date : "%b %d, %Y" }}</time>
            </header>
            <section class="post-excerpt">{{ article.excerpt }}</section>
          </article>
        {% endfor %}
    </main>

    <?php require("components/site-footer.php") ?>
      <!-- {% include "site-footer" %} -->
  </section>

  <!--
  <script>
    $(document).ready(function() {
      currentUrl = window.location.href;
      blogUrl = "{{ site.url }}/{{ page.path }}";
      if (currentUrl === blogUrl) {
        $(".posts-all a").addClass("active");
      };
    });
  </script>
  -->


  <script>var pageType = "blog"</script>
  <?php require("components/javascripts.php") ?>
    <!-- {% include "javascripts" %} -->
  <script>project.initBlogPage();</script>
</body>
</html>