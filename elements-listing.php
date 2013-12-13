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

    <main class="site-content cfx" role="main">
        {% addbutton %} <!-- For page with one catalogue -->
        {% addbutton element_type="Element" %} <!-- For page with multiple catalogues -->
        {% for element in elements %}
          <article class="element">
            <h1><a href="{{ element.url }}">{{ element.title }}</a></h1>
            <time datetime="{{ element.time }}">{{ element.time }}</time>
            <img alt="{{ element.title }}" title="{{ element.title }}" src="{{ element.picture }}">
            <div>{{ element.option }}</div>
            <p>{{ element.info }}</p>
          </article>
        {% endfor %}


      <!--  
        <article class="element">
          <h1><a href="element.php">Third element</a></h1>
          <time datetime="2014-10-09">2014-10-09</time>
          <img alt="Third element" title="Third element" src="http://placeimg.com/322/242/any">
          <div>True</div>
          <p>Lorem ipsum dolor sit amet.</p>
        </article>
      -->
    </main>

    <?php require("components/site-footer.php") ?>
      <!-- {% include "site-footer" %} -->
  </section>

  <script>var pageType = "elements-listing"</script>
  <?php require("components/javascripts.php") ?>
    <!-- {% include "javascripts" %} -->
  <script>project.initBlogPage();</script>
</body>
</html>