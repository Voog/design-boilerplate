# Edicy design boilerplate

## 1. Basic layout structure
### 1.1 Sample code:
```html
<!DOCTYPE html>
<html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <!-- Additional template specific <head> element code. -->
  </head>
  
  <body class="UNIQUE-CLASS-NAME">
    <div class="container cfx">
      {% include "header" %}
  
      <main class="content cfx" role="main">
        <header class="content-header">
          <h1 class="user-content">{% content name="slogan" %}</h1>
        </header>
        <section class="content-body user-content">{% content %}</section>
      </main>
  
      {% include "footer" %}
    </div>
  
    {% include "javascripts" %}
    <script>project.initCommonPage();</script>
  </body>
</html>
```

### 1.2 Comments
* ```<body class="UNIQUE-CLASS-NAME">```
  * Each layout has its own class name for ```<body>``` element to write layout-specific CSS code.
* ```<div class="container cfx">```
  * Each layout ```<body>``` element contains ```<div>``` element with class names **container** and **cfx**
  * ```<div class="container cfx">``` element holds all layout components - header, content, sidebar, footer etc
  * ```<div class="container cfx">``` element is used for styling basic layout. For example website content area positioning, width, background etc
* ```<main class="content cfx" role="main">```
  * Each layout ```container``` element contains ```<main>``` element with class names **content** and **cfx**. ```<main>``` element also has the ```role``` attribute with value **main**
  * ```<main class="content cfx" role="main">``` element holds the main content of the page - Articles listing, article, text, images etc

## 2. Layouts
Layout is a html/liquid code that is used for rendering website pages.

Layouts are located in the folder **/layouts**.
Basic design has 4 layouts:
* Blog & News
* Blog article
* Common page
* Front page

### 2.1 Blog & News / Blog article
#### 2.1.1 Blog & News
Blog and/or news page article listing view.

File location: **/layouts/blog___news.tpl**

##### 2.1.1.1 Sample code
```html
<!DOCTYPE html>
<html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <!-- FACEBOOK OPENGRAPH -->
    <!-- Global opengraph tags are located in "header" component -->
    <meta property="og:url" content="{{ site.url }}/{{ page.path }}">
    <meta property="og:title" content="{{ page.title }} — {{ site.name }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
    <!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
    {{blog.rss_link}}
  </head>
  
  <body class="blog-page">
    <div class="container cfx">
      {% include "header" %}
  
      <main class="content cfx" role="main">
        {% include "tags-blog" %}
        
        {% for article in articles %}
          <article class="post">
            <header class="post-header">
              <h1 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h1>
              <time datetime="{{ article.created_at | date : "%Y-%m-%d" }}" class="post-date">{{ article.created_at | date : "%b %d, %Y" }}</time>
            </header>
            <section class="post-content">
              <div class="post-excerpt">{{ article.excerpt }}</div>
            </section>
            <section class="post-footer">
              <div class="post-author">{{ article.author }}</div>
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

#### 2.1.2 Blog article
Blog and/or news page article detail view.

File location: **/layouts/blog_article.tpl**

##### 2.1.2.1 Sample code
```html
<!DOCTYPE html>
<html lang="{{ page.language_code }}">
  <head>
    {% include "html-head" %}
    <!-- FACEBOOK OPENGRAPH -->
    <!-- Global opengraph tags are located in "header" component -->
    <meta property="og:url" content="{{ site.url }}{{ article.url }}">
    <meta property="og:title" content="{{ article.title }} — {{ article.excerpt | strip_html }} — {{ page.site_title }}">
    <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
    <!-- https://developers.facebook.com/tools/debug - Debug after each modification -->
  </head>
  
  <body class="post-page">
    <div class="container cfx">
      {% include "header" %}
  
      <main class="content user-content cfx" role="main">
        <article class="post">
          <header class="post-header">
            <h1 class="post-title">{% editable article.title %}</h1>
            <time datetime="{{ article.created_at | date : "%Y-%m-%d" }}" class="post-date">{{ article.created_at | date : "%b %d, %Y" }}</time>
            {% include "tags-article" %}
          </header>
          <section class="post-content">
            <div class="post-excerpt">{% editable article.excerpt %}</div>
            <div class="post-body">{% editable article.body %}</div>
          </section>
        </article>
      </main>
  
      {% include "footer" %}
    </div>
  
    {% include "javascripts" %}
    <script>project.initArticlePage();</script>
  </body>
</html>
```

#### 2.1.3 Blog & News comments
**Blog & News** layout **<main>** element contains the for loop that renders a list of the blog/news articles.
* ```<body>``` element has unique class name **blog-page**
* Article name in for loop: **article**

#### 2.1.4 Blog article comments
**Blog article** layout **<main>** element contains the code that renders a blog/news single article.
* ```<body>``` element has unique class name **post-page**

#### 2.1.5 Common Comments
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
