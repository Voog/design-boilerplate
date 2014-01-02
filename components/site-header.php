<header class="site-header">
  <section class="header-left">
    <h1 class="mobile-site-title">Site title</h1>
    <button class="menu-btn js-menu-toggle">
      <div class="btn-inner">
        <div class="menu-stripe"></div>
        <div class="menu-stripe"></div>
        <div class="menu-stripe"></div>
      </div>
    </button>

    <nav class="main-menu" role="navigation">
      <ul class="menu horizontal cfx">
          <li><a href="index.php">Home</a></li>
          <li><a href="products.php">Products</a></li>
          <li><a href="blog-and-news.php">Blog</a></li>
          <li><a href="contacts.php">Contact</a></li>
          <li class="mobile-lang"><a href="contacts.php">In English</a></li>
          <li class="mobile-lang"><a href="contacts.php">eesti keeles</a></li>
          <li class="mobile-lang"><a href="contacts.php">Suomi</a></li>
          <!--
          <li>{% menubtn site.hidden_menuitems %}</li>
          <li>{% menuadd %}</li>
          -->
      </ul>
    </nav>
  </section>

  <section class="header-right">
    <section class="site-search">
      <form id="search" class="edys-search" role="search" method="get" action="#">
        <input id="onpage_search" class="edys-search-input" type="text" placeholder="Search" name="">
        <input class="search-submit" type="submit" value="Search" name="">
      </form>
      <div id="customsearch"></div>
    </section>

    <nav class="lang-menu">
      <select class="lang-select">
        <option value="ENG">In English</option>
        <option value="EST">eesti keeles</option>
        <option value="FIN">Suomi</option>
      </select>
    </nav>

  </section>
</header>