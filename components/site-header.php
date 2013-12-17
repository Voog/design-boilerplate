<header class="site-header">
  <section class="site-header-left">
    <div class="header-logo cfx" role="banner">
        <div role="banner"><a href="#">Site title</a></div>
    </div>
  </section>

  <section class="site-header-right">
    <section class="menu-btn">
      <div class="menu-stripe"></div>
      <div class="menu-stripe"></div>
      <div class="menu-stripe"></div>
    </section>

    <nav class="main-menu cfx" role="navigation">
      <ul class="menu horizontal">
          <li><a class="#" href="#">Home</a></li>
          <li><a href="#">Products</a></li>
          <li><a href="#">Blog</a></li>
          <li><a href="#">Contact</a></li>
          <!--
          <li>{% menubtn site.hidden_menuitems %}</li>
          <li>{% menuadd %}</li>
          -->
      </ul>
    </nav>

    <section class="search-wrap">
      <form id="search" class="edys-search" role="search" method="get" action="#">
        <input id="onpage_search" class="edys-search-input" type="text" placeholder="Search" name="">
        <input class="search-submit" type="submit" value="Search" name="">
      </form>
      <div id="customsearch"></div>
    </section>

    <!-- TODO: Add language menu -->

  </section>
</header>