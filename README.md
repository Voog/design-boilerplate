
# NB! THIS README IS NOT FINAL! SEVERAL THINGS HAVE BEEN CHANGED SINCE THE LAST MODIFICATION AND THIS DOCUMENTATION SHOULD NOT BE USED AS A BULLETPROOF STYLEGUIDE YET!

# Edicy design boilerplate

## 1. Basic layout structure
### 1.1 Example:
```html
<!DOCTYPE html>
<html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <!-- Additional template specific <head> element code. -->
  </head>

  <body class="UNIQUE-CLASS-NAME">
    <div class="container">
      {% include "header" %}

      <main class="content" role="main">
        <header class="content-header">
          <h1 class="content-formatted cfx">{% content name="slogan" %}</h1>
        </header>
        <section class="content-body content-formatted cfx">{% content %}</section>
      </main>

      {% include "footer" %}
    </div>

    {% include "javascripts" %}
    <script>project.initCommonPage();</script>
  </body>
</html>
```

### 1.2 Info
* ```<body class="UNIQUE-CLASS-NAME">```
  * Each layout has its own class name for ```<body>``` element to write layout-specific CSS code.
* ```<div class="container cfx">```
  * Each layout ```<body>``` element contains ```<div>``` element with class names **container** and **cfx**
  * ```<div class="container cfx">``` element holds all layout components - header, content, sidebar, footer etc
  * ```<div class="container cfx">``` element is used for styling basic layout. For example website content area positioning, width, background etc
* ```<main class="content cfx" role="main">```
  * Each layout ```container``` element contains ```<main>``` element with class names **content** and **cfx**.
  * ```<main``` element also has the ```role``` attribute with value **main**
  * ```<main class="content cfx" role="main">``` element holds the main content of the page - Articles listing, article, text areas, images etc


## 2. Formattable areas
Formattable areas are user-editable areas that can be formatted with HTML and included with liquid markup tags.
User-editable areas that can be formatted using HTML, must be wrapped with an element that has class ```content-formatted```

### 2.1 Content areas
Content areas can be included with ```{% content %}``` or ```{% contentblock %}{% endcontentblock %}``` tags.
* Content areas can contain text and images, photo galleries and form fields.
* ```{% content %}``` and ```{% contentblock %}{% endcontentblock %}``` areas are formattable content areas so they must be wrapped with an element that has class ```content-formatted```.
Examples:
```html
<h1 class="content-formatted cfx">{% content name="slogan" %}</h1>
<section class="content-body content-formatted cfx">{% content %}</section>
```
[{% content %} documentation](http://www.edicy.com/developer/template-api/tags/content)
[{% contentblock %} documentation](http://www.edicy.com/developer/template-api/tags/contentblock)

#### 2.1.1 Content area names
Examples:
```html
{% content name="sample" %}
{% contentblock name="sample_name" %}{% endcontentblock %}
```
* Names should be declared in lowercases
* Words should be separated with undescores (to distinct them from class names).

### 2.2 Article formattable areas
Article formattable areas are user-editable areas that can be formatted using HTML and are part of the **article** complex.
Article has 2 formattable areas:
* Article excerpt - ```{{ article.excerpt }}``` or ```{% editable article.excerpt %}```
* Article body - ```{{ article.body }}``` or ```{% editable article.body %}```
```{{ article.excerpt }}``` and ```{{ article.body }}``` areas are formattable content areas so they must be wrapped with an element that has class ```content-formatted```.
Examples:
```html
  <div class="post-excerpt content-formatted cfx">{% editable article.excerpt %}</div>
  <div class="post-body content-formatted cfx">{% editable article.body %}</div>

  <div class="post-excerpt content-formatted">{{ article.excerpt }}</div>
  <div class="post-body content-formatted">{{ editable article.body }}</div>
```
[Article documentation](http://www.edicy.com/developer/template-api/objects/article)

### 2.3 Site header area
Site header area is an user-editable area for defining site header.
Example:
```html
<h1 class="header-title content-formatted cfx"><a href="{{ site.root_item.url }}">{{ site.header }}</a></h1>
<h1 class="content-title content-formatted cfx">{% editable site.header %}</h1>
```

## 3. Layouts
Layout is a html/liquid code that is used for rendering website pages.
Layouts are located in the [/layouts](/layouts) folder.
Basic design has 4 layouts:
* Blog & News
* Blog article
* Common page
* Front page

### 3.1 Blog & News / Blog article
#### 3.1.1 Blog & News
Blog and/or news page article listing view.
File location: [/layouts/blog___news.tpl](/layouts/blog___news.tpl)

##### 3.1.1.1 Example
```html
<!DOCTYPE html>
<html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <!-- FACEBOOK OPENGRAPH -->
    <!-- Global opengraph tags are located in "header" component -->
    <meta property="og:url" content="{{ site.url }}/{{ page.path }}">
    <meta property="og:title" content="{{ page.title }} — {{ site.name }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}"><!-- TODO: Add image location data tag -->
    <!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
    {{blog.rss_link}}
  </head>

  <body class="blog-page">
    <div class="container">
      {% include "header" %}

      <main class="content" role="main">
        {% include "tags-blog" %}

        {% for article in articles %}
          <article class="post">
            <header class="post-header">
              <h1 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h1>
              <time datetime="{{ article.created_at | date : "%Y-%m-%d" }}" class="post-date">{{ article.created_at | date : "%b %d, %Y" }}</time>
            </header>
            <section class="post-content">
              <div class="post-excerpt content-formatted cfx">{{ article.excerpt }}</div>
            </section>
          </article>
        {% endfor %}
      </main>

      {% include "footer" %}
    </div>
    {% include "javascripts" %}
    <script>project.initBlogPage();</script>
  </body>
</html>
```

#### 3.1.2 Blog article
Blog and/or news page article detail view.
File location: [/layouts/blog_article.tpl](/layouts/blog_article.tpl)

##### 3.1.2.1 Example
```html
<!DOCTYPE html>
<html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <!-- FACEBOOK OPENGRAPH -->
    <!-- Global opengraph tags are located in "header" component -->
    <meta property="og:url" content="{{ site.url }}/{{ article.url }}">
    <meta property="og:title" content="{{ article.title }} — {{ article.excerpt | strip_html }} — {{ page.site_title }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}"><!-- TODO: Add image location data tag -->
    <!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
  </head>

  <body class="post-page">
    <div class="container cfx">
      {% include "header" %}

      <main class="content user-content" role="main">
        <article class="post">
          <header class="post-header">
            <h1 class="post-title">{% editable article.title %}</h1>
            <time datetime="{{ article.created_at | date : "%Y-%m-%d" }}" class="post-date">{{ article.created_at | date : "%b %d, %Y" }}</time>
            {% include "tags-article" %}
          </header>
          <section class="post-content">
            <div class="post-excerpt content-formatted cfx">{% editable article.excerpt %}</div>
            <div class="post-body content-formatted cfx">{% editable article.body %}</div>
          </section>
          <footer class="post-footer">
            <div class="post-author">{{ article.author }}</div>
          </footer>
        </article>

        <section class="comments">
          <h2 class="comments-title">
            {% case article.comments_count %}{% when 0 %}{{ "no_comments" | lc }}{% else %}{{ "comments_for_count" | lc }}: <span class="comments-count">{{ article.comments_count }}</span>{% endcase %}</h2>

          {% for comment in article.comments %}
            <div class="comment">{{ comment.body_html }} {{ comment.author }}, ({{ comment.created_at | date : "%b %d, %Y" }})</div>
          {% endfor %}

          {% include "comment-form" %}
        </section>
      </main>

      {% include "footer" %}
    </div>

    {% include "javascripts" %}
    <script>project.initArticlePage();</script>
  </body>
</html>
```

#### 3.1.3 Info
* **Blog & News** layout **<main>** element contains the for loop that renders a list of the blog/news articles.
* **Blog & News** ```<body>``` element has unique class name **blog-page**
* **Blog article** layout **<main>** element contains the code that renders a blog/news single article.
* **Blog article** ```<body>``` element has unique class name **post-page**
* Blog article container element is ```<article>``` and has class attribute named **post**
  * If post listing and detail views use identical **post** output, then the code should be a separate **component**.
* Each element class name in ```<article class="post"></article>``` has prefix **post-**
  * ```<article class="post"></article>``` element can have three different containers:
    * ```<header class="post-header"></header>```
      * Post header element. Contains the title, creation date, author etc
    * ```<section class="post-content"></section>```
      * Post content element. Contains the excerpt, body etc
    * ```<footer class="post-footer"></footer>```
      * Post footer element. Contains the title, creation date, author etc
    * If containers are not needed for styleing, then they can be left out from the code.
    * ```<article class="post"></article>``` can contain specific components:
      * The article title ```{{ article.title }}``` must be inside element with ```class="post-title"```
      * The article creation date ```{{ article.created_at }}``` must be inside element with ```class="post-date"``` and have datetime attribute in the following format: ```{{ article.created_at | date : "%Y-%m-%d" }}```
      * The article excerpt ```{{ article.excerpt }}``` must be inside element with ```class="post-excerpt"```
      * The article body ```{{ article.body }}``` must be inside element with ```class="post-body"```

### 3.2 Common page
Common content page view.
File location: [/layouts/common_page.tpl](/layouts/common_page.tpl)

#### 3.2.1 Example
```html
<!DOCTYPE html>
<html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <!-- FACEBOOK OPENGRAPH -->
    <!-- Global opengraph tags are located in "header" component -->
    <meta property="og:url" content="{{ site.url }}/{{ page.path }}">
    <meta property="og:title" content="{{ page.title }} — {{ site.name }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}"><!-- TODO: Add image location data tag -->
    <!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
  </head>

  <body class="common-page">
    <div class="container cfx">
      {% include "header" %}

      <main class="content" role="main">
        <header class="content-header">
          <h1 class="content-formatted cfx">{% content name="slogan" %}</h1>
        </header>
        <section class="content-body content-formatted cfx">{% content %}</section>
      </main>

      {% include "footer" %}
    </div>

    {% include "javascripts" %}
    <script>project.initCommonPage();</script>
  </body>
</html>
```

#### 3.2.2 Info
* ```<body>``` element has unique class name **common-page**
* **Blog & News** layout ```<main>``` element contains the ```{{ content }}``` area with no name to render default page sample content.

### 3.3 Front page
Front page view.

File location: [/layouts/front_page.tpl](/layouts/front_page.tpl)

#### 3.3.1 Example
```html
<!DOCTYPE html>
<html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <!-- FACEBOOK OPENGRAPH -->
    <!-- Global opengraph tags are located in "header" component -->
    <meta property="og:url" content="{{ site.url }}">
    <meta property="og:title" content="{{ site.name }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fb_image }}"><!-- TODO: Add image location data tag -->
    <!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
  </head>

  <body class="front-page">
    <div class="container">
      {% include "header" %}

      <main class="content" role="main">
        <header class="content-header">
          <h1 class="content-title content-formatted cfx">{% editable site.header %}</h1>
          <h2 class="content-slogan content-formatted cfx">{% content name="slogan" %}</h2>
        </header>
        <section class="content-body content-formatted cfx">{% content %}</section>
      </main>

      {% include "footer" %}
    </div>

    {% include "javascripts" %}
    <script>project.initCommonPage();</script>
  </body>
</html>
```

## 4. Components
Components are reusable code snippets that can be included in layouts or other components.

Components are located in the folder [/components/](/components/)
Basic design components are:
* footer
* header
* html-head
* javascripts
* lang-menu
* nav-menu
* search
* sidebar
* tags-article
* tags-blog
* topbar

### 4.1 footer
**Optional** component
Contains site footer area code.
File location: [/components/footer.tpl](/components/footer.tpl)

#### 4.1.1 Example
```html
  <footer class="footer content-formatted cfx">
    {% xcontent name="footer" %}
  </footer>
```

#### 4.1.2 Info
* Footer is wrapped with ```<footer>``` element with class names **footer** and **cfx**.
* If footer has one content area it name should be **footer**.
* If footer has many content areas their names should start with the **header_** prefixes.
* Footer content areas are global so they must have the **x** prefix before {% content %}.
[{{ xcontent }} documentation](http://www.edicy.com/developer/template-api/tags/xcontent)

### 4.2 header
**Optional** component
Contains site header area code. For example navigation menu, language menu, mobile-menu button etc.
File location: [/components/header.tpl](/components/header.tpl)

#### 4.2.1 Example
```html
<header class="header">
  <section class="header-left">
    <h1 class="header-title"><a href="{{ site.root_item.url }}">{{ site.header }}</a></h1>
    <button class="menu-btn js-menu-toggle">
      <span class="btn-inner"><span class="menu-stripe"></span><span class="menu-stripe"></span><span class="menu-stripe"></span></span>
    </button>

    <nav class="main-menu" role="navigation">
      {% include "nav-menu" %}
    </nav>
  </section>

  <section class="header-right">
    {% include "search" %}
    {% include "lang-menu" %}
  </section>
</header>
```

#### 4.2.2 Info
* Header is wrapped with ```<header>``` element with class names **header**.
* If header has one content area it name should be **header**.
* If header has many content areas their names should start with the **header_** prefixes.
* header content areas are global so they must have the **x** prefix before {% content %}.
[{{ xcontent }} documentation](http://www.edicy.com/developer/template-api/tags/xcontent)

### 4.3 html-head
**Required** component.
Contains site ```<head>``` tag code.
File location: [/components/html-head.tpl](/components/html-head.tpl)

#### 4.3.1 Example
```html
<!-- BASIC META INFO -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="{{ page.keywords }}">
<meta name="description" content="{{ page.description }}">
<meta name="author" content="{{ site.author }}">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

<!-- FAV ICON -->
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="{{ images_path }}/{{ page.data.touchicon }}"> <!-- TODO: Add image location data tag -->

<!-- STYLESHEETS -->
{% stylesheet_link "main.css" %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.css?1" %}<![endif]-->

<!-- MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC -->
<script src="{{ javascripts_path }}/modernizr.js?1"></script>
<!-- http://modernizr.com/download/ - Check for updates -->

<!-- TITLE -->
<title>{% if article %}{{ article.title }} | {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.site_title }} | {{ page.title }}{% endif %}{% endif %}</title>

<!-- FACEBOOK OPENGRAPH -->
<!-- Page specific opengraph tags are located in each page template -->
<meta property="fb:admins" content="XXXXXXXXXX"> <!--Site admin's Facebook user id -->
<!-- http://graph.facebook.com/"username" - Replace "username" with site admin's username to get admin's ID) -->
<meta property="og:type" content="website">
<meta property="og:description" content="{{ page.description }}">
<!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
```

#### 4.3.2 Info
* **html-head** code should be divided into separate blocks in the following order:
  * Basic meta info
  * Fav- and touch-icons
  * Stylesheets
  * Javascripts (that must be loaded before the ```<body>``` element)
  * Title tag
  * Facebook opengraph (global settings)

### 4.4 javascripts
**Required** component.
Contains site javascript links and inline javascripts that must be loaded at the end of the code.
File location: [/components/javascripts.tpl](/components/javascripts.tpl)

#### 4.4.1 Example
```html
<script src="{{ javascripts_path }}/jquery.js?1"></script>
<script src="{{ javascripts_path }}/main.js?1"></script>

<!-- REPLACE IMAGES WITH RETINA READY DUPLICATES -->
<script src="{{ javascripts_path }}/retina.js?1"></script>

<!-- EDICY SITE SEARCH PLUGIN -->
{% if site.search.enabled %}
  <script src="http://static.edicy.com/assets/site_search/3.0/site_search.js?2"></script>
  <script>
    var edys_site_search_options = {
      texts: { noresults: "{{ "search_noresults" | lc }}" },
      default_stylesheet_enabled: false
    }
  </script>
{% endif %}

<script>
  // ADDITIONAL INLINE SCRIPTS AREA
</script>

<!-- EDICY GOOGLE ANALYTICS SHORTCODE -->
{% unless editmode %}{{ site.analytics }}{% endunless %}
```

#### 4.4.2 Info
**javascripts** code should be divided into separate blocks in the following order:
* Javascripts in the [/javascripts](/javascripts) folder
  * **jQuery** file link (if used)
  * **main.js** file link (if used)
  * **retina.js** file link (if used)
  * Additional javascripts links (plugins etc)
* Site search plugin code
* Additional inline javascripts (plugins initiations etc)
* Google analytics code


### 4.5 lang-menu
**Optional** component.
Contains site language menu.
File location: [/components/lang-menu.tpl](/components/lang-menu.tpl)

#### 4.5.1 Examples
```html
{% if editmode or site.has_many_languages? %}
  <nav class="lang-menu">
    <select class="lang-select">
      {% for language in site.languages %}
        <option value="{{language.url}}" {% if language.selected? %}selected="selected"{% endif %}>{{language.title}}</option>
      {% endfor %}
    </select>
    {% if editmode %}{% languageadd %}{% endif %}
  </nav>
{% endif %}
```

```html
{% if editmode or site.has_many_languages? %}
  <nav class="lang-menu">
    <ul class="menu">
      {% for language in site.languages %}
        <li class="lang-link {% if language.selected? %} active{% endif %}"><a href="{{language.url}}">{{language.title}}</a></li>
      {% endfor %}
      {% if editmode %}<li class="lang-add">{% languageadd %}</li>{% endif %}
    </ul>
  </nav>
{% endif %}
```

#### 4.5.2 Info
* **Language menu** is **<nav>** element that contains the ```<select>``` element or the ```<ul>``` element that lists available page languages.
* **Language menu** **<nav>** element has class **lang-menu**.
* **Language menu** ```<select>``` element has class **lang-select**.
* **Language menu** ```<ul>``` element has class **menu**.
* **Language menu** ```<select>``` or ```<ul>``` element contains the for loop that renders available page languages.
  * If ```<select>``` is used, the loop generates ```<option>``` elements (with class name **lang-select** if needed ).
  * If ```<ul>``` is used, the loop generates ```<li>``` elements (with class **lang-link** if needed).
* Language menu code is inside ```{% if editmode or site.has_many_languages? %}{% endif %}``` condition (to show language menu only in editmode or when site has more then one language).
* After the languge listing, additonal element (```<li>``` when ```<ul>``` is used ) with add langugage button is included.
  * This element is wrapped with the ```{% if %}{% endif %}``` condition to prevent rendering the empty ```<li>``` or other container in the preview- or publicmode.
[Language documentation](http://www.edicy.com/developer/template-api/objects/language)
